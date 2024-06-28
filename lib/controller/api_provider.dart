import 'dart:convert';
import 'dart:developer';
import 'package:advance_flutter_exam/helper/api_services.dart';
import 'package:advance_flutter_exam/model/data_model.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier{
  DataModel? data;
  bool isLoading = true;

  Future<void> fetchData() async {

    isLoading = true;
    notifyListeners();

    String? json = await ApiServices().apiCalling();
    if(json != null){
      data = DataModel.fromJson(jsonDecode(json));
    }
    else{
      log('------------ null ------------');
    }

    isLoading = false;
    notifyListeners();
  }

  ApiProvider(){
    fetchData();
  }
}