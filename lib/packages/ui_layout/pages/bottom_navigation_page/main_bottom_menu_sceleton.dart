import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/main.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:kaizen/packages/ui_layout/widgets_for_all_pages/end_drawer/end_drawer_app_bar.dart';

class MyBottomMenuSceleton extends StatefulWidget {
  static const id = '/';
  String email;

  MyBottomMenuSceleton({Key? key, required this.email}) : super(key: key);

  @override
  State<MyBottomMenuSceleton> createState() => _MyBottomMenuSceletonState();
}

class _MyBottomMenuSceletonState extends State<MyBottomMenuSceleton> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // чтобы можно было сделать прозрачным баттон навигатор бар
      endDrawer: MyEndDrawer(),
      body: Obx(
        () => listBodyPagesMenuBottomNavigation[
            controllerSetting.currentTabIndex.value],
      ),
      bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
