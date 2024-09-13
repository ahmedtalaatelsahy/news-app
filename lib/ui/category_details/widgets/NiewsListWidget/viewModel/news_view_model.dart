import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/api_manager.dart';
import '../../../../../model/news_respons/Article.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsInitialState());

  loadArticles(String sourceId) async {
    emit(NewsLoadingState());
    try {
      var newsResponse = await ApiManager.getNews(sourceId);
      if (newsResponse.status == "error") {
        emit(NewsErrorState(newsResponse.message!));
      } else {
        emit(NewsSuccessState(newsResponse.articles ?? []));
      }
    } catch (error) {
      emit(NewsErrorState(error.toString()));
    }
  }
}

sealed class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {
  List<Article> articles;
  NewsSuccessState(this.articles);
}

class NewsErrorState extends NewsStates {
  String error;
  NewsErrorState(this.error);
}
