import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

import '../../pages/other_pages/authentication_page/views/login_page.dart';

class MyEndDrawer extends StatelessWidget {
  static openEndDrawer({color}) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
        icon: const FaIcon(
          FontAwesomeIcons.cog,
          size: 15,
        ),
        color: color ?? Theme.of(context).textTheme.headline6!.color,
      );
    });
  }

  MyEndDrawer({Key? key}) : super(key: key);

  ButtonStyle styleButtonDrawer(Color? backgroundColor, Color? colorTitle) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(backgroundColor ?? Colors.black12),
      foregroundColor:
          MaterialStateProperty.all<Color>(colorTitle ?? Colors.white),
    );
  }

  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 60,
                    // backgroundColor: Colors.grey,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/1200/501'),
                    child: Text(''),
                  ),
                ),
                GetBuilder<ImplementSettingGetXController>(
                  builder: (controller) => ListTile(
                    title: Text(controller.switchChangeTheme
                        ? 'Темная тема'
                        : 'Светлая тема'),
                    leading: Icon(Icons.color_lens_outlined),
                    trailing: Switch(
                      value: controller.switchChangeTheme,
                      //чтобы отслеживать системную тему
                      onChanged: (bolVal) {
                        controller.changeTheme(bolSwitch: bolVal);
                        Get.changeThemeMode(
                          bolVal ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                    // onTap: () {
                    //   print('onTap Profile');
                    // },
                    // onLongPress: () {
                    //   print('LONG PRESS');
                    // },
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    print('onTap Home');
                  },
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.account_box_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    print('onTap Profile');
                  },
                  onLongPress: () {
                    print('LONG PRESS');
                  },
                ),
                ListTile(
                  title: Text('Images'),
                  leading: Icon(Icons.image),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    print('onTap Images');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Выход'),
                  style: styleButtonDrawer(null, null),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  child: Text('Войти'),
                  style: styleButtonDrawer(null, null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
