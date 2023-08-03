// ignore_for_file: depend_on_referenced_packages

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/article.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
