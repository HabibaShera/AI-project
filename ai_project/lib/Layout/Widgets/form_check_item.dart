import 'package:flutter/material.dart';

import '../constants.dart';

class FormChekItem extends StatefulWidget {
  const FormChekItem(this.title, this.onCheck, {Key? key}) : super(key: key);
  final String title;
  final Function(bool value) onCheck;
  @override
  State<FormChekItem> createState() => _FormChekItemState();
}

class _FormChekItemState extends State<FormChekItem> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: (val) {
        setState(() => value = val!);
        widget.onCheck(value);
      },
      title: Text(widget.title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 1, color: cColorMain)),
      checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      checkColor: Colors.white,
      activeColor: cColorMain,
    );
  }
}
