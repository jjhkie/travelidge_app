import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      child: Container(
        height: 500,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: const [
                    Expanded(flex: 1, child: Icon(Icons.search)),
                    Expanded(
                      flex: 9,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '어디로 떠나세요?'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print('$index');
                      },
                      child: SizedBox(
                        height: 50,
                        child: Expanded(
                          child: Text('목적지 $index'),
                        ),
                      ),
                    );
                  },
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
                  child: const Text('확인')),
            ],
          ),
        ),
      ),
    );
  }
}
