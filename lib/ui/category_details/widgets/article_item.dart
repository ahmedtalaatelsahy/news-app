import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../model/news_respons/Article.dart';

class ArticleItem extends StatelessWidget {
   Article article;
   ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children:
      [CachedNetworkImage(
          imageUrl: article.urlToImage??"",
        height: MediaQuery.of(context).size.height*0.3,
        width: double.infinity,
        placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error,size: 30,),),
        imageBuilder: (context, imageProvider) => Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image:imageProvider,fit: BoxFit.fill )),
        ),
      ),
        SizedBox(height: 10,),
        Text(article.source?.name??"",style: TextStyle(color: Color(0xff79828B),fontWeight: FontWeight.w400,fontSize: 10),),
        SizedBox(height: 10,),
        Text(article.title??"",style: TextStyle(color: Color(0xff42505C),fontWeight: FontWeight.w500,fontSize: 14),),
        SizedBox(height: 10,),
        Text(timeago.format(DateTime.parse(article.publishedAt??"")),style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w400),)
      ],

      ),
    );

  }
}
