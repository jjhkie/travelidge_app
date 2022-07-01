


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/ui/write/controller/write_controller.dart';


class DestinationBottomSheet extends StatelessWidget {
  const DestinationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      child: Container(
        height: 800,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: [
              Row(
                children:[
                  Icon(Icons.search),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'locationBs'.tr),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: Get.find<WriteController>().location.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () =>Get.find<WriteController>().destinationClick(index),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(Get.find<WriteController>().location[index])
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return Divider(thickness:1); },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
