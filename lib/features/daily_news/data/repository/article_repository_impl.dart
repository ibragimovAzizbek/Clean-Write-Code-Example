import 'dart:io';

import 'package:cleanwritecode/core/constants/constants.dart';
import 'package:cleanwritecode/core/resources/dat_state.dart';
import 'package:cleanwritecode/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleanwritecode/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/article_repositroy.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        category: categoryQuery,
        country: countryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.unknown,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
