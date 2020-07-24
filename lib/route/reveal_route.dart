import 'package:flutter/material.dart';
import 'package:flutter_animation/widget/circular_reveal.dart';

class RevealRoute extends PageRouteBuilder {
  final Widget page;
  final AlignmentGeometry centerAlignment;
  final Offset centerOffset;
  final double minRadius, maxRadius;

  RevealRoute(
      {@required this.page,
      this.centerAlignment,
      this.centerOffset,
      this.minRadius = 0,
      @required this.maxRadius})
      : assert(centerOffset != null || centerAlignment != null),
        super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return page;
            },
            transitionDuration: Duration(milliseconds: 1000));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ClipPath(
      clipper: CircularRevealClipper(
          fraction: animation.value,
          centerAlignment: centerAlignment,
          centerOffset: centerOffset,
          maxRadius: maxRadius,
          minRadius: minRadius),
      child: child,
    );
  }
}
