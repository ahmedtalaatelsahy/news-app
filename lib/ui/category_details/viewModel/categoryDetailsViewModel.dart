import 'package:flutter/material.dart';

import '../../../api/api_manager.dart';
import '../../../model/sources_response/Source.dart';


class CategoryDetailsViewModel extends ChangeNotifier{
  String? errorMessage;
  List<Source>? sourcesList;
  bool isLoading = false;
  loadSources(String categoryId)async{
    isLoading = true;
    errorMessage = null;
    sourcesList = null;
    notifyListeners();
    try{
      // call api
      var sourcesResponse =  await ApiManager.getSources(categoryId);
      // handle error
      if(sourcesResponse.status=="error"){
        errorMessage = sourcesResponse.message;
        isLoading = false;
        notifyListeners();
      }else{
        // handle success -> sources reached successfully
        isLoading = false;
        sourcesList = sourcesResponse.sources;
        notifyListeners();
      }
    }catch(error){
      // handle error
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }

  }



}