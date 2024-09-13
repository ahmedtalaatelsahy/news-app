import 'package:flutter/material.dart';

import '../../../../api/api_manager.dart';
import '../../../../model/news_respons/Article.dart';
import '../../../../model/sources_response/Source.dart';
import '../article_item.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  const NewsListWidget({super.key,required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(widget.source.id??""),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError || snapshot.data?.status == "error"){
          return Column(
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }
        List<Article> articles = snapshot.data?.articles??[];
        return ListView.separated(
          itemCount:  articles.length,
          itemBuilder: (BuildContext context, int index)=> ArticleItem(
            article:articles[index],

          ),
          separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10,),

        );
      },);
  }
}