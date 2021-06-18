import 'package:flutter/material.dart';

InputDecoration decoration(String text, {Widget? suffix}) {
  return InputDecoration(
      labelText: text,
      suffix: suffix,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)));
}
