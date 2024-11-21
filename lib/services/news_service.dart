import 'package:dio/dio.dart';
import 'package:news/models/news_tile_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<NewsTileModel>> getNews({required String category}) async {
    try {
      final Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?category=$category&apiKey=6eb2051751984dcab63690b986520768');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<NewsTileModel> models = [];
      for (var i = 0; i < articles.length; i++) {
        models.add(
          NewsTileModel(
            newsImage: articles[i]['urlToImage'],
            newsHeadline: articles[i]['title'],
            newsInfo: articles[i]['description'],
            siteUrl: articles[i]["url"],
          ),
        );
      }
      return models;
    } catch (e) {
      return [];
    }
  }
}
