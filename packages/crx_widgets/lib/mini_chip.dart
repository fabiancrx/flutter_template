import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Custom MiniChip even smaller than  [Chip]
class MiniChip extends StatelessWidget {
  final String label;
  final Color color;

  const MiniChip({this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(color: color ?? deterministicChipColor(label), shape: BoxShape.rectangle, borderRadius: BorderRadius.all(const Radius.circular(10))),
      child: AutoSizeText(
        label,
        overflow: TextOverflow.ellipsis,
        minFontSize: 5.0,
        maxFontSize: 12,
        stepGranularity: 1.0,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}

class MiniChipRow extends StatelessWidget {
  final List<String> labels;

  const MiniChipRow({Key key, this.labels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (labels.length == 1) return MiniChip(label: labels[0]);
    if (labels.length >= 1) {
      return Row(
        children: <Widget>[
          for (var s in labels) MiniChip(label: s),
        ],
      );
    }
    return Container();
  }
}

final _colorChips = <Color>[
  Color(0xf0dd4e4e),
  Color(0xf0db4f7a),
  Color(0xf0854fdb),
  Color(0xf0594fdb),
  Color(0xf04f8fdb),
  Color(0xf04fdba5),
  Color(0xf04fdb70),
  Color(0xf075db4f),
  Color(0xf0dbd84f),
  Color(0xf0d87750),
];

Color deterministicChipColor(String name) {
  return _colorChips[name.hashCode % _colorChips.length];
}
