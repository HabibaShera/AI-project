import 'package:flutter/material.dart';

import '../constants.dart';

class DataField extends StatelessWidget {
  const DataField(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: kInputDecorationDataField(title),
      style: const TextStyle(color: Colors.white),
    );
  }
}
