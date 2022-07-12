import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';

class LocationBottomSheet extends StatelessWidget {
  LocationBottomSheet({Key? key}) : super(key: key);

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
                  itemCount: HomeController.to.location.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () =>HomeController.to.locationClick(index),
                      child: Container(
                        alignment: Alignment.centerLeft,
                          height: 40,
                          child: Text(HomeController.to.location[index])
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return Divider(thickness:1); },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: Colors.black,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: Get.back,
                  child: Text('CheckOn'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
