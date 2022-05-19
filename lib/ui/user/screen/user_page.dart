import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/controller/infinite_scroll_controller.dart';
import 'package:travelidge/ui/user/widgets/user_widget.dart';

class user extends GetView<InfiniteScrollController>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll'),
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(10.0),



          child: ListView.separated(
            controller: controller.scrollController.value,

            itemBuilder: (_, index) {
              if (index < controller.travel.length) {
                var data = controller.travel[index];
                return Material(
                  elevation: 10.0,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Image.network('${data.titleImage}'),
                      title: Text('title : ${data.title}'),
                      subtitle: Text('travelNo : ${data.travelNo} '),
                      trailing: Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                );
              }
              if (controller.hasNext.value || controller.isLoading.value) {
                return Center(child: RefreshProgressIndicator());
              }
              //데이터 새로고침
              return refresh();
            },
            separatorBuilder: (_, index) => Divider(),
            itemCount: controller.travel.length + 1,
          ),
        ),
      ),
    );
  }
}