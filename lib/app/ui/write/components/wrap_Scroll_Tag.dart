

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:travelidge/app/ui/write/controller/write_controller.dart';

Widget wrapScrollTag({required int index, required Widget child}) =>
    AutoScrollTag(
      key: ValueKey(index),
      controller: WriteController.to.autoController,
      index: index,
      child: child,
    );