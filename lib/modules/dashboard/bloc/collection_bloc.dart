import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:test_task/models/collection_model.dart';
import 'collection_state.dart';

class CollectionBloc extends Cubit<CollectionState> {
  CollectionBloc() : super(const CollectionState()){

    if(!Platform.environment.containsKey('FLUTTER_TEST')){
      loadCollection();
      checkNetwork();
    }

  }


  Future<void> loadCollection() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      var data = await rootBundle.loadString('assets/json/whiskey_data.json');
      List<dynamic> jsonData = jsonDecode(data);
      List<CollectionModel> collection = jsonData
          .map((item) => CollectionModel.fromJson(item))
          .toList();
      emit(state.copyWith(collection: collection, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  checkNetwork(){
    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      print(result);
      emit(state.copyWith(networkEnabled: result.first != ConnectivityResult.none));
      // Received changes in available connectivity types!
    });
  }
}