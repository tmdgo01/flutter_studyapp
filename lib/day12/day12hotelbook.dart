// 호텔 예약 화면
// 기능 1. 호텔에 묵을 날짜, 시간 설정
// 기능 2-1. 호텔 옵션 택 1 (마운틴 뷰, 오션 뷰, 레이크 뷰 등)
// 기능 2-2. 호텔 옵션 택 2 (마운틴 뷰, 디럭스 룸, VIP 룸 등)
// 기능 3. 호텔 사용자 이름 입력
// 기능 4. 조식 서비스 on/off
// 기능 5. [개인 정보 제공 동의] 체크박스
// 기능 6. 체크 박스 선택 후 ElevatedButton 클릭 시 예약 완료 메시지(AlertDialog) 표시

// AlertDialog 내용
// (사용자 명)님의 호텔 예약 결과
// 예약 날짜: (선택한 날짜)
// 예약 시간: (선택한 시간)
// 예약 옵션: (선택한 옵션)
// 조식 서비스: (여부)

import 'package:flutter/material.dart';

void main() {
  runApp(HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '호텔 예약', home: HotelBookingScreen());
  }
}

class HotelBookingScreen extends StatefulWidget {
  @override
  _HotelBookingScreenState createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedOption = '마운틴 뷰';
  String _userName = '';
  bool _breakfastIncluded = false;
  bool _privacyAgreement = false;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  void _showReservationDialog() {
    if (!_privacyAgreement) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('개인 정보 제공 동의를 체크해주세요.')));
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('예약 완료'),
          content: Text(
            '${_userName}님의 호텔 예약 결과\n'
            '예약 날짜: ${_selectedDate?.toLocal().toString().split(' ')[0]}\n'
            '예약 시간: ${_selectedTime?.format(context)}\n'
            '예약 옵션: $_selectedOption\n'
            '조식 서비스: ${_breakfastIncluded ? "포함" : "미포함"}',
          ),
          actions: [
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('호텔 예약')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('예약 날짜:', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    _selectedDate == null
                        ? '날짜 선택'
                        : '${_selectedDate?.toLocal().toString().split(' ')[0]}',
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(
                    _selectedTime == null
                        ? '시간 선택'
                        : '${_selectedTime?.format(context)}',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('호텔 옵션:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedOption,
              items: <String>['마운틴 뷰', '오션 뷰', '레이크 뷰']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: '사용자 이름'),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _breakfastIncluded,
                  onChanged: (bool? value) {
                    setState(() {
                      _breakfastIncluded = value ?? false;
                    });
                  },
                ),
                Text('조식 서비스 포함'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _privacyAgreement,
                  onChanged: (bool? value) {
                    setState(() {
                      _privacyAgreement = value ?? false;
                    });
                  },
                ),
                Text('개인 정보 제공 동의'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showReservationDialog,
              child: Text('예약 완료'),
            ),
          ],
        ),
      ),
    );
  }
}
