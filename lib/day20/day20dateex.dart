void main() {
  final TodayDate = DateTime.utc(2025, 08, 01, 10, 30,);
  print(TodayDate);
  basic(); // 기본 날짜 생성
  utc(); // utc 기준 날짜 생성
  duration(); // duration 객체 사용 생성
  now(); // 현재 날짜 생성
  dateCalc(); // 날짜 계산

  final DayDate = DateTime.now();
  print(DayDate);
}

void basic() {
  final date = DateTime(2025, 8, 1);
  print('기본 날짜: $date');
}

void utc() {
  final date = DateTime.utc(2025, 8, 1, 12, 0, 0);
  print('UTC 날짜: $date');
}

void duration() {
  final base = DateTime(2025, 8, 1);
  final added = base.add(Duration(days: 5));
  print('5일 후 날짜: $added');
}

void now() {
  final now = DateTime.now();
  print('현재 날짜와 시간: $now');
}

void dateCalc() {
  final date1 = DateTime(2025, 8, 1);
  final date2 = DateTime(2025, 7, 20);
  final diff = date1.difference(date2).inDays;
  print('날짜 차이: $diff일');
  final same = date1.isAtSameMomentAs(date2);
  print(same);
}
