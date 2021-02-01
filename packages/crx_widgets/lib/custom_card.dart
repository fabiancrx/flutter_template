import 'package:flutter/widgets.dart';

class CornerRoundedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CornerRoundedCard({Key key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0xFF3A5160).withOpacity(0.2), offset: Offset(1.1, 1.1), blurRadius: 10.0),
          ],
        ),
        child: child,
      ),
    );
    ;
  }
}
