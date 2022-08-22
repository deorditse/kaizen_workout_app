import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);
//header calendar
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              headerText,
              style: Theme.of(context).textTheme.headline1,

              // TextStyle(
              //   fontSize: 20.0,
              // ),
            ),
          ),
          TextButton(
            onPressed: onTodayButtonTap,
            child: Text(
              "today",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            onPressed: onRightArrowTap,
          ),
          SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }
}
