import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Template',
          maxLines: 2,
        ),
      ),
      body: Center(
        child: FlutterLogo(
          size: 69,
        ),
      ),
    );
  }
}
