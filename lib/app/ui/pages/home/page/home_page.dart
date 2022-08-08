import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelidge/app/ui/pages/home/components/home_components.dart';
import 'package:travelidge/app/ui/pages/home/controller/home_controller.dart';
import 'package:travelidge/app/ui/theme/app_widgets.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),

      body: SafeArea(
        child: NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: headerSliverBuilder,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([homeList()]))
          ],
        )),
      ),
    );
  }
}

