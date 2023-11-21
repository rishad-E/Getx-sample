import 'package:flutter/material.dart';

Widget titleText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
  );
}

Widget subTitleText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
  );
}
