import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: id,
                  child: Container(
                    width: 250,
                    clipBehavior:
                        Clip.hardEdge, // clipBehavior는 자식의 부모 영역 침범을 체어하는 방법
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15, // 그림자가 얼마나 멀리까지 드리울지
                            offset: const Offset(
                                10, 10), // 그림자의 위치(태양의 위치를 바꾼다고 생각하면 됨)
                            color: Colors.black.withOpacity(0.5),
                          )
                        ]),
                    child: Image.network(thumb),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
