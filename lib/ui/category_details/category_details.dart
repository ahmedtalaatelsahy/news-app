
import 'package:flutter/material.dart';
import 'package:news_app/ui/category_details/viewModel/categoryDetailsViewModel.dart';
import 'package:news_app/ui/category_details/widgets/news_list_widget/news_list.dart';
import 'package:news_app/ui/category_details/widgets/source_tab.dart';
import 'package:provider/provider.dart';


class CategoryDetailsTab extends StatefulWidget {
  String categoryId;

  CategoryDetailsTab({super.key, required this.categoryId});

  @override
  State<CategoryDetailsTab> createState() => _CategoryDetailsTabState();
}

class _CategoryDetailsTabState extends State<CategoryDetailsTab> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.loadSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, categoriesDetailsViewModel, child) {
          if (categoriesDetailsViewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (categoriesDetailsViewModel.errorMessage != null) {
            return Column(
              children: [
                Text(categoriesDetailsViewModel.errorMessage ?? ""),
                ElevatedButton(
                    onPressed: () {
                      categoriesDetailsViewModel.loadSources(widget.categoryId);
                    },
                    child: Text("Try Again"))
              ],
            );
          }
          return DefaultTabController(
            length: categoriesDetailsViewModel.sourcesList?.length ?? 0,
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
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        color: Theme.of(context).colorScheme.primary),
                    tabs: categoriesDetailsViewModel.sourcesList
                        ?.map((source) => SourceTabWidget(
                      source: source,
                    ))
                        .toList() ??
                        []),
                Expanded(
                    child: TabBarView(
                        children: categoriesDetailsViewModel.sourcesList
                            ?.map((source) => NewsListWidget(
                          source: source,
                        ))
                            .toList() ??
                            []))
              ],
            ),
          );
        },
      ),
    );

  }
}