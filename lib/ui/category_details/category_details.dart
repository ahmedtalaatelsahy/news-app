

import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/widgets/news_list.dart';
import 'package:news_app/ui/category_details/widgets/source_tab.dart';

import '../../api/api_manager.dart';
import '../../model/sources_response/Source.dart';

class CategoryDetailsTab extends StatefulWidget {
  String categoryId;
  CategoryDetailsTab({super.key,required this.categoryId});

  @override
  State<CategoryDetailsTab> createState() => _CategoryDetailsTabState();
}

class _CategoryDetailsTabState extends State<CategoryDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryId),
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
        List<Source> sources = snapshot.data?.sources??[];
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                  padding: EdgeInsets.all(16),
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.white,
                  dividerHeight: 0,
                  unselectedLabelColor: Theme.of(context).colorScheme.primary,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      color: Theme.of(context).colorScheme.primary
                  ),
                  tabs: sources.map((source) => SourceTabWidget(source: source,)).toList()
              ),
              Expanded(
                child: TabBarView(
                    children: sources.map((source) => NewsListWidget(source: source,)).toList()),
              )
            ],
          ),
        );
      },
    );
  }
}