import 'package:flutter/material.dart';






/// Example default implementation 
/// ```dart
/// Widget defaultFadeInImageNetwork({@required String imageSrc}) {
///  if (imageSrc == null || imageSrc.isEmpty) return Image.asset(notFoundAssetImagePath);
///  return FadeInImage.assetNetwork(
///    placeholder: notFoundAssetImagePath,
///    image: imageSrc,
///    fit: BoxFit.cover,
///  );
///}
/// ```


class FadeInImageDefault extends StatelessWidget {
  final String defaultImageSrc;
  final String src;

  const FadeInImageDefault({Key key, this.src, this.defaultImageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src == null || src.isEmpty) return Image.asset(defaultImageSrc );

    return FadeInImage.assetNetwork(
      placeholder: defaultImageSrc,
      image: src,
      fit: BoxFit.cover,
    );
  }
}
