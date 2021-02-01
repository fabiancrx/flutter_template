import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

extension ClickableExtensions on Widget {
  Widget clickable(void Function() action, {bool opaque = true}) {
    return Clickable(onTap: action, opaque: opaque);
  }
}

class Clickable extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool opaque;

  const Clickable({Key key, @required this.onTap, this.opaque = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: opaque ?? false,
        child: this,
      ),
    );
  }
}
