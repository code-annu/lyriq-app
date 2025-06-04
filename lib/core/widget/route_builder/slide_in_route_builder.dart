import 'package:flutter/material.dart';

Route buildHorizontalSlideInRoute(Widget page, {bool isLeftToRight = true}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = isLeftToRight ? Offset(-1.0, 0.0) : Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class SlideInHorizontalPageRoute extends PageRouteBuilder {
  final Widget page;
  final Offset startOffset;

  SlideInHorizontalPageRoute({
    required this.page,
    this.startOffset = const Offset(1.0, 0.0),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           var tween = Tween(
             begin: startOffset,
             end: Offset.zero,
           ).chain(CurveTween(curve: Curves.easeInOut));
           return SlideTransition(
             position: animation.drive(tween),
             child: child,
           );
         },
       );
}
