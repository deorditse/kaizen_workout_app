import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_chat_page/app_bar_chat.dart';

class BodyChatPage extends StatefulWidget {
  const BodyChatPage({Key? key}) : super(key: key);

  @override
  State<BodyChatPage> createState() => _BodyChatPageState();
}

class _BodyChatPageState extends State<BodyChatPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        mySliverChatAppBar(context),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Center(child: Text('Page chat')),
            ],
          ),
        ),
      ],
    );
  }
}
