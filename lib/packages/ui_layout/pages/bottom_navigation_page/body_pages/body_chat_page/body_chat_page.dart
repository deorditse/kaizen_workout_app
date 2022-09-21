import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_chat_page/app_bar_chat.dart';

class BodyChatPage extends StatefulWidget {
  const BodyChatPage({Key? key}) : super(key: key);

  @override
  State<BodyChatPage> createState() => _BodyChatPageState();
}

class _BodyChatPageState extends State<BodyChatPage> {
  @override
  void initState() {
    super.initState();
    Get.put(ChatControllerGetxState());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        mySliverChatAppBar(context),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(ChatControllerGetxState.instance.test),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Flexible(
                      flex: 2,
                      child: Image.network(
                        'https://s1.iconbird.com/ico/2013/11/481/w256h2561383944523springjoggernotext.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            'Упс.. Что тут у нас!!!',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Страница в стадии разработки',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              _containerWithQ(),
            ],
          ),
        ),
      ],
    );
  }

  _containerWithQ() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: myStyleContainer(context: context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  'Хотите увидеть здесь чат? 🔥',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Flexible(
                        child: const Text(
                          "не вижу смысла",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "будет очень удобно",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
