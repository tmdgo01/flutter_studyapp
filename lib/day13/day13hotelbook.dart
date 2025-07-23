// 호텔 예약 화면의 각 기능을 서로 다른 페이지로 만들어서 각 단계의 내용을 전부 입력했을 대 버튼 활성화, 다음 단계 페이지로 넘어갈 수 있도록 구현

// 1. 호텔에 묵을 날짜, 시간 설정
// 2. 호텔 옵션 택 1 (마운틴 뷰, 오션 뷰, 레이크 뷰 등)
// 3. 호텔 옵션 택 2 (마운틴 뷰, 디럭스 룸, VIP 룸 등)
// 4. 호텔 사용자 이름 입력
// 5. 조식 서비스 on/off
// 6. [개인 정보 제공 동의] 체크박스
// 7. 체크 박스 선택 후 ElevatedButton 클릭 시 예약 완료 메시지(AlertDialog) 표시

// 페이지를 이동할 때 현재 페이지의 변수를 다음 페이지로 전달
// 데이터 전달 : MaterialPageRoute(builder: (context) => 다음페이지(변수: 변수값))
// 데이터 미전달 : MaterialPageRoute(builder: (context) => 다음페이지())

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Day13HotelBookApp());
}

class HotelReservation {
  DateTime? date;

  String? option1;
  String? option2;
  String? userName;
  bool breakfast = false;
  bool agreed = false;

  HotelReservation();
}

class Day13HotelBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '호텔 예약', home: HotelBookingScreen());
  }
}

class HotelBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('호텔 예약')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SelectDate(reservation: HotelReservation()),
              ),
            );
          },
          child: Text('예약하기'),
        ),
      ),
    );
  }
}

class SelectDate extends StatefulWidget {
  final HotelReservation reservation;

  const SelectDate({Key? key, required this.reservation}) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('날짜 및 시간 선택')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selectedDateTime != null
                ? DateFormat('yyyy-MM-dd – kk:mm').format(selectedDateTime!)
                : '날짜와 시간을 선택하세요',
          ),
          ElevatedButton(
            onPressed: () async {
              // 날짜 선택
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );

              if (pickedDate != null) {
                // 시간 선택
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  final combinedDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  setState(() {
                    selectedDateTime = combinedDateTime;
                  });
                }
              }
            },
            child: Text('날짜 및 시간 선택'),
          ),
          ElevatedButton(
            onPressed: selectedDateTime != null
                ? () {
                    widget.reservation.date = selectedDateTime;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SelectOption1(reservation: widget.reservation),
                      ),
                    );
                  }
                : null,
            child: Text('다음'),
          ),
        ],
      ),
    );
  }
}

class SelectOption1 extends StatelessWidget {
  final HotelReservation reservation;

  const SelectOption1({Key? key, required this.reservation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('호텔 옵션 선택 1')),
      body: Column(
        children: [
          RadioListTile(
            title: Text('마운틴 뷰'),
            value: 'Mountain View',
            groupValue: reservation.option1,
            onChanged: (value) {
              reservation.option1 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectOption2(reservation: reservation),
                ),
              );
            },
          ),
          RadioListTile(
            title: Text('오션 뷰'),
            value: 'Ocean View',
            groupValue: reservation.option1,
            onChanged: (value) {
              reservation.option1 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectOption2(reservation: reservation),
                ),
              );
            },
          ),
          RadioListTile(
            title: Text('레이크 뷰'),
            value: 'Lake View',
            groupValue: reservation.option1,
            onChanged: (value) {
              reservation.option1 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectOption2(reservation: reservation),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SelectOption2 extends StatelessWidget {
  final HotelReservation reservation;

  const SelectOption2({Key? key, required this.reservation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('호텔 옵션 선택 2')),
      body: Column(
        children: [
          RadioListTile(
            title: Text('디럭스 룸'),
            value: 'Deluxe Room',
            groupValue: reservation.option2,
            onChanged: (value) {
              reservation.option2 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterUserName(reservation: reservation),
                ),
              );
            },
          ),
          RadioListTile(
            title: Text('VIP 룸'),
            value: 'VIP Room',
            groupValue: reservation.option2,
            onChanged: (value) {
              reservation.option2 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterUserName(reservation: reservation),
                ),
              );
            },
          ),
          RadioListTile(
            title: Text('스위트 룸'),
            value: 'Suite Room',
            groupValue: reservation.option2,
            onChanged: (value) {
              reservation.option2 = value as String;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnterUserName(reservation: reservation),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EnterUserName extends StatefulWidget {
  final HotelReservation reservation;

  const EnterUserName({Key? key, required this.reservation}) : super(key: key);

  @override
  _EnterUserNameState createState() => _EnterUserNameState();
}

class _EnterUserNameState extends State<EnterUserName> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('성명 입력')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              userName = value;
            });
          },
          decoration: InputDecoration(
            labelText: '성명',
            border: OutlineInputBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: userName.isNotEmpty
            ? () {
                widget.reservation.userName = userName;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BreakfastService(reservation: widget.reservation),
                  ),
                );
              }
            : null,
        child: const Text('다음'),
      ),
    );
  }
}

class BreakfastService extends StatefulWidget {
  final HotelReservation reservation;

  const BreakfastService({Key? key, required this.reservation})
    : super(key: key);

  @override
  _BreakfastServiceState createState() => _BreakfastServiceState();
}

class _BreakfastServiceState extends State<BreakfastService> {
  bool _isBreakfastSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('조식 서비스 선택')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text('조식'),
              value: _isBreakfastSelected,
              onChanged: (bool? value) {
                setState(() {
                  _isBreakfastSelected = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              _isBreakfastSelected ? '조식 포함' : '조식 미포함',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.reservation.breakfast = _isBreakfastSelected;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PrivacyAgreement(reservation: widget.reservation),
            ),
          );
        },
        child: const Text('다음'),
      ),
    );
  }
}

class PrivacyAgreement extends StatefulWidget {
  final HotelReservation reservation;

  PrivacyAgreement({required this.reservation});

  @override
  _PrivacyAgreementState createState() => _PrivacyAgreementState();
}

class _PrivacyAgreementState extends State<PrivacyAgreement> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이용 약관')),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('개인 정보 제공에 동의합니다. \n동의하지 않을 시 예약이 불가능합니다.'),
            value: agreed,
            onChanged: (value) {
              setState(() {
                agreed = value ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: agreed
                ? () {
                    widget.reservation.agreed = true;

                    // 예약 정보 정리
                    String formattedInfo =
                        '''
          예약이 완료되었습니다. 
          예약 정보:
          성명: ${widget.reservation.userName}
          날짜 - 시간: ${DateFormat('yyyy-MM-dd – kk:mm').format(widget.reservation.date!)}
          조식 포함: ${widget.reservation.breakfast ? '포함' : '미포함'}
          ''';

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('예약 완료'),
                        content: Text(formattedInfo),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('확인'),
                          ),
                        ],
                      ),
                    );
                  }
                : null,
            child: Text('예약 완료'),
          ),
        ],
      ),
    );
  }
}
