import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 위젯 그 자체
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// State 클래스
//데이터를 가지고 있는 부분
// 위젯의 UI를 구축하는 곳. state가 바뀌면 UI가 새로고침되면서 최신 데이터를 보여줌
// stateful 위젯의 데이터는 클래스 프로퍼티
class _MyAppState extends State<MyApp> {
  // int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      // state 클래스에게 데이터가 변경되었음을 알리는 메서드
      numbers.add(numbers.length);
      // counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
