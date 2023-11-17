import 'package:flutter/material.dart';
import 'package:realtoonflix/models/webtoon_model.dart';
import 'package:realtoonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

  // ------state를 사용하는 fetch-------
  // List<WebtoonModel> webtoons = [];
  // bool isLoading = true;

  // void waitForWebToons() async {
  //   webtoons = await ApiService.getTodaysToons();
  //   isLoading = false;
  //   setState(() {}); //State는 최대한 많이 안쓰는게 좋다?
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   waitForWebToons();
  // }

  // ------ state를 사용하지 않는 fetch (추천) ---------
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1, //AppBar 밑에 그림자 없애는 것
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        // FutureBuilder가 알아서 state없이 fetch 함수를 await해서 가져와서 보여준다
        future: webtoons, // 위에서 Future형으로 fetch 함수를 받아오도록 만들어놓은 변수
        builder: (context, snapshot) {
          // snapshot은 future의 상태를 알 수 있음
          if (snapshot.hasData) {
            // return const Text("There is data!");
            // return ListView.builder(
            // 그냥 한번에 전부 보여주는 ListView보다 좀 더 최적화된 listView임
            // 사용자가 보고 있는 아이템만 build함
            // 사용자가 안보고 있는 아이템은 메모리에서 삭제함
            // scrollDirection: Axis.horizontal,
            // return makeList(snapshot);
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ), //Expanded는 화면의 남는 공간을 차지하는 위젯
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // ListView.builder보다 separatorBuilder라는 필수인자를 하나 더 가짐
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        // index는 빌드되는 아이템의 index. 어떤 아이템이 빌드되는지 알 수 있음
        var webtoon = snapshot.data![index];
        // print(index);
        return Column(
          children: [
            Container(
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
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      },
      // 위젯을 리턴해야하는 함수. 위젯은 리스트 아이템 사이에 렌더링됨(아이템을 구분하기위해)
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
