import 'package:flutter/material.dart';

String nameApp = 'Kaizen';

Color myDefaultDialogBackground(BuildContext context, {double? opacity}) =>
    Theme.of(context).cardColor.withOpacity(opacity ?? 0.8);
