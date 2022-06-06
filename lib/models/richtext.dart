import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MouseRegionSpan extends WidgetSpan {
  MouseRegionSpan(
      {required MouseCursor mouseCursor,
      required InlineSpan inlineSpan})
      : super(
            child: MouseRegion(cursor: mouseCursor, child: Text.rich(inlineSpan)));
}
