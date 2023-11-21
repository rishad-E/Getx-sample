import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apisample/model/model.dart';
import 'package:getx_apisample/service/service.dart';

class MakeupController extends GetxController {
  var isLoading = false.obs;
  var resData = <ResponseModel>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading(true);
      var data = await ApiService().getMakeupData();

      if (data != null) {
        resData.assignAll(data);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white);
      log(e.toString(), name: 'controller error');
    } finally {
      isLoading(false);
    }
  }
}


