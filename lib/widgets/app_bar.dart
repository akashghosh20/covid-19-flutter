import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: Text(
      "Covid-19 Tracker",
      style: TextStyle(
        fontSize: 24,
      ),
    ),
    centerTitle: true,
    elevation: 0.0,
  );
}
