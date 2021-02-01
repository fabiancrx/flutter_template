import 'package:flutter/material.dart';
import 'frosted.dart';


class CatalogCard extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final ImageProvider image;
  final Function onTap;

  const CatalogCard(this.title, this.subtitle, this.image, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                foregroundDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: ClipRect(
//                      clipper: TrapeziumClipper(),

                    child: Frost(Column(children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top: 8.0), child: title),
                      Padding(padding: const EdgeInsets.only(bottom: 8.0), child: subtitle),
                    ])),
                    clipper: RectangleClipper(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width, size.height * 0.08);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

class RectangleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(RectangleClipper oldClipper) => false;
}
