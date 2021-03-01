import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Type alias for a function `PageBuilder` that takes no params and returns a [Widget]

typedef PageBuilder = Widget Function();

/// A utility class for defining page routes
///
/// These static routes are intended to ease the usage of different transitions
/// with different widgets without all the boilerplate.(e.g. by [Navigator.push]),
/// Instead of:
/// ```dart
/// Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>MyWidget()));
/// ```
/// Now you can:
/// ```dart
/// Navigator.of(context).push(PageRoute.fade(()=>MyPage()))
/// ```
/// It's a little less verbose and is more versatile as you add more custom transitions.

class PageRoutes {
  static const double kDefaultDuration = .3;
  static const Curve kDefaultEaseFwd = Curves.easeOut;
  static const Curve kDefaultEaseReverse = Curves.easeOut;

  static Route<T> material<T>(PageBuilder page) => MaterialPageRoute(builder: (c) => page());

  /// See [FadeTransition]
  static Route<T> fade<T>(
    PageBuilder page, {
    double duration = kDefaultDuration,
  }) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  /// See [SlideTransition]
  static Route<T> slide<T>(
    PageBuilder page, {
    double duration = kDefaultDuration,
    Offset startOffset = const Offset(1, 0),
    Curve easeFwd = kDefaultEaseFwd,
    Curve easeReverse = kDefaultEaseReverse,
  }) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final reverse = animation.status == AnimationStatus.reverse;
        return SlideTransition(
          position: Tween<Offset>(begin: startOffset, end: const Offset(0, 0))
              .animate(CurvedAnimation(parent: animation, curve: reverse ? easeReverse : easeFwd)),
          child: child,
        );
      },
    );
  }

  ///PageRoute that transitions on the X, Y or Z axis, where Z represents scale.
  /// Recommended for pages that are related to one another
  static Route<T> sharedAxis<T>(PageBuilder page,
      {SharedAxisTransitionType transitionType = SharedAxisTransitionType.vertical,
      double duration = kDefaultDuration}) {
    return PageRouteBuilder<T>(
        pageBuilder: (BuildContext context, Animation primaryAnimation, Animation secondaryAnimation) => page(),
        transitionsBuilder:
            (BuildContext context, Animation primaryAnimation, Animation secondaryAnimation, Widget child) =>
                SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: transitionType,
                    child: child),
        transitionDuration: Duration(milliseconds: (duration * 1000).round()));
  }

  /// PageRoute where outgoing elements fade out and incoming elements fade in and scale up.
  /// Recommended for pages that have no strong relationship to each other.
  static Route<T> fadeThrough<T>(PageBuilder page, {double duration = kDefaultDuration}) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(animation: animation, secondaryAnimation: secondaryAnimation, child: child);
      },
    );
  }

  ///PageRoute generally used for small views and dialogs
  ///Elements that enter use a quick fade in and scale from 80% to 100%. Elements that exit fade out.
  /// eg: [Dialog],[PopupMenu],[Toast],[FloatingActionButton]
  static Route<T> fadeScale<T>(PageBuilder page, {double duration = kDefaultDuration}) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }

  /// Also See [OpenContainer] Which is a container that grows to fill the screen
  /// to reveal new content when tapped. Similar to a Hero widget(But better). Just wrap your widget with it.
  /// If .tappable is set to true(default) the whole widget will start the transition,
  /// else you can set the .action in the builder to a specific component in your widget tree to start the transition.
  ///  To exit just call `Navigator.pop()`.
}
