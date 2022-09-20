import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class TabItem {
  String title;
  FaIcon icon;

  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Главная', icon: FaIcon(FontAwesomeIcons.home)),
  TabItem(title: 'Тренировки', icon: FaIcon(FontAwesomeIcons.braille)),
  TabItem(title: 'Чат', icon: FaIcon(FontAwesomeIcons.comments)),
  TabItem(title: 'Профиль', icon: FaIcon(FontAwesomeIcons.user)),
];

class MyBottomNavigatorBar extends StatelessWidget {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        iconSize: 15,
        backgroundColor: Theme.of(context).cardColor.withOpacity(0.9),
        elevation: 0,
        fixedColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(icon: item.icon, label: item.title)
        ],
        onTap: (index) {
          controllerSetting.currentTabIndex.value = index;
        },
        currentIndex: controllerSetting.currentTabIndex.value,
      ),
    );
  }
}
