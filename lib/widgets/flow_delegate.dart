import 'package:flutter/material.dart';

class MyFlowDelegate extends FlowDelegate {
  MyFlowDelegate({
    required this.scrollableState,
    required this.listItemContext,
    required this.imageKey,
  }): super(repaint : scrollableState.position);
  final ScrollableState scrollableState;
  final BuildContext listItemContext;
  final GlobalKey imageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
  final scrollableBox = scrollableState.context.findRenderObject() as RenderBox;
  final listItemBox = listItemContext.findRenderObject() as RenderBox;
  final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox);
      
  // Determine the percent position of this list item within the
  // scrollable area.
  final viewportDimension = scrollableState.position.viewportDimension;
  final scrollFraction =
      (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
  final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
  final backgroundSize =
      (imageKey.currentContext!.findRenderObject() as RenderBox)
          .size;
  final listItemSize = context.size;
  final childRect =
      verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);
      context.paintChild(
    0,
    transform:
        Transform.translate(offset: Offset(0.0, childRect.top)).transform,
  );
  }
  @override
  bool shouldRepaint(covariant MyFlowDelegate oldDelegate) {
    return scrollableState != oldDelegate.scrollableState ||
        listItemContext != oldDelegate.listItemContext ||
        imageKey != oldDelegate.imageKey;
  }
}
