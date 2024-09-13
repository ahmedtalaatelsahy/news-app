import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';

class SearchAppar extends StatefulWidget {
  SearchAppar({super.key,});

  @override
  State<SearchAppar> createState() => _SearchApparState();
}

class _SearchApparState extends State<SearchAppar> {

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isActive) Text("news app"),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
                duration: Duration(milliseconds: 10),
                child: !isActive
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            isActive = true;
                          });
                        },
                      )
                    : Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              hintText: "Search Article",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.primary),
                              suffixIcon: Icon(Icons.search),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    isActive = false;
                                  });
                                },
                              )),
                        ),
                      )),

          ),
        ),

      ],
    );
  }
}
