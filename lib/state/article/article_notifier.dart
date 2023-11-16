import 'package:brain_log/extensions/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../models/article.dart';
import '../../utility/utility.dart';
import 'article_state.dart';

////////////////////////////////////////////////

final articleProvider = StateNotifierProvider.autoDispose.family<ArticleNotifier, ArticleState, DateTime>((ref, date) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return ArticleNotifier(const ArticleState(), client, utility)..getArticle(date: date);
});

class ArticleNotifier extends StateNotifier<ArticleState> {
  ArticleNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  Future<void> getArticle({required DateTime date}) async {
    await client.post(path: APIPath.getOnedayArticle, body: {'date': date.yyyymmdd}).then((value) {
      final list = <Article>[];

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        // ignore: avoid_dynamic_calls
        final val = Article.fromJson(value['data'][i] as Map<String, dynamic>);
        list.add(val);
      }

      state = state.copyWith(articleList: list);
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

////////////////////////////////////////////////
