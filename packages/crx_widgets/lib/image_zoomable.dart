import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/// Image widget that zooms the [image] on tapping on it.
/// You can Specify the default [compactSize] and [expandedSize].
/// Typically the sizes passed are [MediaQuery] and relatives to the viewport.
/// Example:
/// ```dart
///                   ImageZoomable(image, )
/// ```
class ImageZoomable extends StatefulWidget {
  final String heroTag;
  final ImageProvider image;
  final Size compactSize;
  final Size expandedSize;
  final Curve curve;
  final Duration duration;

  const ImageZoomable(
      this.image, {
        Key key,
        @required this.heroTag,
        this.compactSize,
        this.expandedSize,
        this.curve = Curves.ease,
        this.duration = const Duration(milliseconds: 350),
      }) : super(key: key);

  @override
  _ImageZoomableState createState() => _ImageZoomableState();
}

class _ImageZoomableState extends State<ImageZoomable> {
  bool minified = false;

  @override
  Widget build(BuildContext context) {
    // Default relative sizes
    final screenSize = MediaQuery.of(context).size;
    final defaultExpandedSize =
    Size(screenSize.width / 2, screenSize.height / 3);
    final defaultCompactSize =
    Size(screenSize.width * .9, screenSize.height * .8);

    final height = minified
        ? widget?.compactSize?.height ?? defaultCompactSize.height
        : widget?.expandedSize?.height ?? defaultExpandedSize.height;
    final width = minified
        ? widget?.compactSize?.width ?? defaultCompactSize.width
        : widget?.expandedSize?.width ?? defaultExpandedSize.width;
    print('height:$height <---> width:$width');
    print(
        'defaultExpandedSize.height:${defaultCompactSize.height} <---> defaultExpandedSize.width:${defaultCompactSize.width}');
    return AnimatedContainer(
      duration: widget.duration,
      width: width,
      height: height,
      curve: widget.curve,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(image: widget.image, fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
                offset: Offset(0.0, 10.0))
          ]),
      child: Hero(
        tag: widget.heroTag,
        child: GestureDetector(
          onTap: () {
            setState(() {
              minified = !minified;
            });
          },
        ),
      ),
    );
  }
}
