import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final Widget content;
  final bool compact;
  final double iconSize;

  const ContactItem(this.title,
      {Key key, this.content, this.compact = false, this.iconSize = 14, this.icon = Icons.keyboard_arrow_right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (content != null) {
      return compact ? compactItem() : fullItem();
    } else
      return item(title);
  }

//refactor: explain which is full compact and regular item
  Row item(Widget label) => Row(
        children: <Widget>[
          Icon(
            icon,
            size: iconSize,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
              child: label,
            ),
          ),
        ],
      );

  Row compactItem() => Row(
        children: <Widget>[
          Icon(
            icon,
            size: iconSize,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
            child: title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
              child: content,
            ),
          ),
        ],
      );

  Column fullItem() => Column(
        children: <Widget>[
          item(title),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
                  child: content,
                ),
              ),
            ],
          ),
        ],
      );
}
