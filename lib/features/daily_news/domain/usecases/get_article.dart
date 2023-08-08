import '../../../../core/resources/dat_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repositroy.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
