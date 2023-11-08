// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player {
  String?
      name; // ?는 이 파라미터를 가질수도 가지지 않을 수도 있다. 생성자에 마우스를 올려놨을떄 ?가 없는 파라미터는 필수값임

  Player({required this.name}); // named constructor 이름과 값을 같이 줌. 이름으로 파라미터 구분
}

void main() {
  var nico = Player(name: "nico");

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // CupertinoApp: 애플느낌
    // MaterialApp: 구글느낌
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF181818),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
