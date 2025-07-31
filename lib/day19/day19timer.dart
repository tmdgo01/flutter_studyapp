import 'dart:async';

void main(){
  print("Timer");
  int number = 0;
  Timer.periodic(
    Duration(seconds: 3),
      (Timer timer){
      print("after $number");
      number++;

      if(number == 54) {
        timer.cancel();
      }
      }
  );
}