import 'package:cleanwritecode/core/resources/dat_state.dart';
import 'package:cleanwritecode/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
