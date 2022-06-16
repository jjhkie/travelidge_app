
import 'package:flutter/material.dart';
import 'package:travelidge/ui/home/controller/home_controller.dart';
import 'package:travelidge/ui/home/widgets/SliverHeaderData.dart';
import 'package:travelidge/ui/home/widgets/list_item_header_sliver.dart';

const _maxHeaderExtent = 200.0;
const _minHeaderExtent = 70.0;

class AppBarHeader extends SliverPersistentHeaderDelegate {
  AppBarHeader({required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = (shrinkOffset) / _maxHeaderExtent;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0 - controller.globalOffsetValue.value,
          child: Container(
            color: Colors.white,
            height: _maxHeaderExtent,
            child: Column(
              children: [
                const SizedBox(height: 3,),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: percent > 0.0
                          ? ListItemHeaderSliver(controller: controller)
                          : const SliverHeaderData()),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
