import 'package:flutter/material.dart';

class reservation extends StatelessWidget {
  const reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("해리포터와 비밀의 방",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/harrypotter2.png',
                fit: BoxFit.contain,
                width: 400.0,
                height: 400.0,),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return reservation();
                      },
                    ),
                    );
                  },
                    child: Text("10시"),),

                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return reservation();
                      },
                    ),
                    );
                  }, child: Text("13시"),),

                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return reservation();
                      },
                    ),
                    );
                  }, child: Text("16시"),),

                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return reservation();
                      },
                    ),
                    );
                  }, child: Text("19시"),),
                ],
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
