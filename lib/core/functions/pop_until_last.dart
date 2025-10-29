import 'package:flutter/material.dart';

void popUntilLast(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}
