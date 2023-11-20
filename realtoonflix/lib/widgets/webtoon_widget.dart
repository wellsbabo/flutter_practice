import 'package:flutter/material.dart';
import 'package:realtoonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            // fullscreenDialog: true,  // 클릭한 화면이 바닥에서부터 올라오게함. 돌아가는 버튼도 X로 바뀜
          ), // builder는 route를 만드는 함수
        );
      },
      child: Column(
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
                      offset:
                          const Offset(10, 10), // 그림자의 위치(태양의 위치를 바꾼다고 생각하면 됨)
                      color: Colors.black.withOpacity(0.5),
                    )
                  ]),
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
