import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realtoonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // print(webtoon);
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error(); // Futer는 미래에 받을 값의 타입을 알려줌
  }
}
