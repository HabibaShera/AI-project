import 'package:flutter/material.dart';

import '../constants.dart';

class FormSelector<T> extends StatefulWidget {
  const FormSelector(this.items, this.title, this.onSelect, {Key? key}) : super(key: key);
  final List<T> items;
  final String title;
  final Function(T value) onSelect;
  @override
  State<FormSelector> createState() => _FormSelectorState<T>();
}

class _FormSelectorState<T> extends State<FormSelector> {
  T? btnValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1, color: cColorMain)),
      child: DropdownButton<T>(
        underline: const SizedBox(),
        isExpanded: true,
        items: widget.items.map((value) => DropdownMenuItem<T>(child: Text(value), value: value)).toList(),
        onChanged: (value) => setState(() {
          btnValue = value ?? btnValue;
          widget.onSelect(value);
        }),
        value: btnValue,
        dropdownColor: Colors.grey,
        elevation: 0,
        style: TextStyle(color: Colors.white),
        hint: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
