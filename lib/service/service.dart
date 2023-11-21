

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:getx_apisample/model/model.dart';
import 'package:getx_apisample/utils/constants/api.dart';

class ApiService{
  Dio dio = Dio();
  String path = Apis().baseUrl;

  Future<List<ResponseModel>?>getMakeupData() async{
    try {
      
      Response response = await dio.get(path);

    if (response.statusCode == 200) {
      List<dynamic> data  = response.data;
      final res = data.map((json) => ResponseModel.fromJson(json)).toList();
      return res;
    }

    } catch (e) {
      log(e.toString(),name: 'service error');
    }
    return null;
  }
}
