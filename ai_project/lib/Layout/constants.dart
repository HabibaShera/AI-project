import 'dart:isolate';

import 'package:flutter/material.dart';

TextStyle kTextStyleTitle = const TextStyle(fontSize: 20);
Isolate? iso1;

//==================================== Colors
Color cColorMain = Colors.white;
Color cColorbackground = Colors.white;
Color cColorSecondery = const Color(0xff252658);
//===================================== Doubles
//===================================== Lists
List<String> cGenders = ["Male", "Female"];
List<String> cWorkTypes = ["Never Worked", "Private", "Self-employed", "Govt jov", "Children"];
List<String> cSmokingStates = ["Formelly smoking", "Never smoked", "Smoking"];
List<String> cResidenceTypes = ["Rural", "Urban"];
//==================================== TextStyles
TextStyle cTextStyleTitle = TextStyle(fontSize: 20, color: cColorMain);
TextStyle cTextStylePageTitle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: cColorMain);
//==================================== Input Decorations
InputDecoration kInputDecorationDataField(String title) => InputDecoration(
      hintText: title,
      labelText: title,
      hintStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: cColorMain)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: cColorMain)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red)),
    );

//==================================== Enum Classes
enum ScreenSizeType {
  wep,
  tablet,
  mobile,
}
