import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class NewsPage extends StatefulWidget {
  static const id = '/news_page';

  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
        // actions: [
        //   MyEndDrawer.openEndDrawer(),
        // ],
      ),
      // endDrawer: MyEndDrawer(),
      body: Center(
          child: Container(
        child: Text('NewsPage'),
      )),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
