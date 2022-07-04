
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

/** 목적지 페이지*/
Widget destinationPage() {
  return Container(
    height: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('destination_t'.tr, style: TextStyle(fontSize: 20)),
        GestureDetector(
          onTap: () => WriteController.to.destinationToggle(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 5),
                Obx(() => Text(WriteController.to.bottomSheetDe.value,
                    style: TextStyle(fontSize: 16)))
              ],
            ),
          ),
        )
      ],
    ),
  );
}