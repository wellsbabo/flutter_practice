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
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 상태를 초기화하는 메서드. 꼭 사용하지는 않아도됨
    // 많이 사용하지는 않을지도? API에서 데이터를 받을때?
    // build 메서드보다 앞에 있어야함
    // 오직 단 한번만 호출됨 (실행될때? 랜더링될때?)
    super.initState(); // 이걸 선언하고 사용해야함
    print('initState!');
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 제거될 때 호출되는 메서드
    // 무언가를 취소하는 곳. 위젯이 위젯 트리에서 제거되기 전에 무언가를 취소
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
