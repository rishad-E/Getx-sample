import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apisample/controller/controller.dart';
import 'package:getx_apisample/utils/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MakeupController controller = Get.put(MakeupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 204, 204),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 204, 204),
        toolbarHeight: 70,
        title: const Text("GetX Sample"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.resData.length,
          itemBuilder: (context, index) {
            final data = controller.resData[index];
            return Padding(
              padding: const EdgeInsets.all(13),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(
                    left: 20,right: 15
                  ),
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.white,
                    child: Image.network(
                      'https:${data.apiFeaturedImage.toString()}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: titleText(data.brand.toString()),
                  subtitle: subTitleText(data.name.toString()),
                  trailing:subTitleText(data.price.toString()),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
