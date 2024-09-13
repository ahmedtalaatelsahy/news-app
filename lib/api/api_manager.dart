import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_respons/NewsResponse.dart';
import 'package:news_app/model/sources_response/SourcesResponse.dart';

import '../model/search_response/Search_response.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "ca6ff105942842f88a2ca8e845562dc5";
static Future<SourcesResponse> getSources(String categoryId) async {
    Uri sourcesApiUrl = Uri.https(baseUrl, "/v2/top-headlines/sources",
        {"apiKey": apiKey, "category": categoryId});
    http.Response response = await http.get(sourcesApiUrl);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse= SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
static Future<NewsResponse> getNews(String sourceId)async{

    Uri newsUrl=Uri.https(baseUrl,"/v2/everything",{
      "sources":sourceId,
      "apiKey":apiKey
    });
   http.Response response=await http.get(newsUrl);
   Map<String,dynamic> json=jsonDecode(response.body);
   NewsResponse newsResponse= NewsResponse.fromJson(json);
   return newsResponse;
  }
 static Future<SearchResponse> search(String searchId)async{
  Uri searchUrl=Uri.https(baseUrl,"/v2/everything",{
    "q":searchId,
    "apiKey":apiKey
  });
 http.Response response=await http.get(searchUrl);
 Map<String,dynamic> json=jsonDecode(response.body);
  SearchResponse searchResponse=SearchResponse.fromJson(json);
  return searchResponse;
  }
}
