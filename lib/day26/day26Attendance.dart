import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Day26Attendance(),
    );
  }
}

class Day26Attendance extends StatefulWidget {
  @override
  State<Day26Attendance> createState() => _Day26AttendanceState();
}

class _Day26AttendanceState extends State<Day26Attendance> {
  late GoogleMapController mapController;
  String checkInStatus = "출근 전입니다.";
  bool isCheckedIn = false; // ✅ 출근 상태 토글

  final LatLng companyLocation = LatLng(35.171422, 126.888097);
  final double checkInRadius = 100;

  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(35.171422, 126.888097),
    zoom: 17,
  );

  LatLng? currentLocation;
  StreamSubscription<Position>? positionStream;
  bool followUser = true;

  @override
  void initState() {
    super.initState();
    checkLocationPermission().then((_) {
      startLocationTracking();
    });
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("위치 서비스가 꺼져 있습니다. 설정에서 켜주세요.")),
        );
      }
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("위치 권한이 필요합니다.")),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("위치 권한이 영구적으로 거부되었습니다. 설정에서 권한을 허용해주세요."),
          action: SnackBarAction(
            label: "설정",
            onPressed: () {
              openAppSettings();
            },
          ),
        ),
      );
    }
  }

  void startLocationTracking() {
    positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      LatLng newLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        currentLocation = newLocation;
      });

      if (followUser && mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newLatLng(newLocation),
        );
      }
    });
  }

  Future<void> toggleAttendance() async {
    if (!isCheckedIn) {
      // 출근 체크
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        double distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          companyLocation.latitude,
          companyLocation.longitude,
        );

        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
        });

        if (distance <= checkInRadius) {
          DateTime now = DateTime.now();
          setState(() {
            checkInStatus = "출근 완료: ${now.hour}시 ${now.minute}분";
            isCheckedIn = true;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("출근 체크 완료!")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("출근 체크 실패: 회사 위치에서 너무 멀리 있습니다.")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("위치 정보를 가져올 수 없습니다: $e")),
        );
      }
    } else {
      // 출근 취소
      setState(() {
        isCheckedIn = false;
        checkInStatus = "출근 전입니다.";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("출근이 취소되었습니다.")),
      );
    }
  }

  Set<Marker> getMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: MarkerId("company"),
        position: companyLocation,
        infoWindow: InfoWindow(title: "회사 위치"),
      ),
    };
    return markers;
  }

  Set<Circle> getCircles() {
    return {
      Circle(
        circleId: CircleId("company_radius"),
        center: companyLocation,
        radius: checkInRadius,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeColor: Colors.blue,
        strokeWidth: 2,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: getMarkers(),
            circles: getCircles(),
          ),

          // 출근 상태 표시
          Positioned(
            top: 50,
            left: 20,
            right: 70,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                checkInStatus,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 내 위치 버튼
          Positioned(
            top: 50,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.my_location, color: Colors.blue),
                onPressed: () {
                  if (currentLocation != null) {
                    mapController.animateCamera(
                      CameraUpdate.newLatLng(currentLocation!),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),

      // 출근 체크 토글 버튼 (왼쪽 하단)
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            onPressed: toggleAttendance,
            backgroundColor: isCheckedIn ? Colors.green : Colors.grey,
            child: Icon(
              isCheckedIn ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.white,
            ),
            tooltip: isCheckedIn ? "출근 취소" : "출근 체크",
          ),
        ),
      ),
    );
  }
}
