import 'package:flutter/material.dart';

BoxDecoration myStyleContainer({
  required context,
  color,
  borderRadius,
}) {
  return BoxDecoration(
    color: color ?? Theme.of(context).cardColor,
    borderRadius: borderRadius ?? BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 2,
        blurRadius: 4,
        // offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  );
}

