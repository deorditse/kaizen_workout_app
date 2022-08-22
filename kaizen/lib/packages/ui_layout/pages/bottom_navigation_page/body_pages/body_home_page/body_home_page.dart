import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/admin_horizontal_list_sports_workout/admin_scrollListSportsWorkoutModel.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/app_bar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/scrollListSportsWorkoutModel.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_text_field.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MySliverHomeAppBar(),
        // MyHomeAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ImplementAppStateGetXController>(
                builder: (controller) => SizedBox(
                  height: controller.dataSportsWorkoutList.isNotEmpty ? 5 : 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  // shadowColor: Colors.,
                  elevation: 15,
                  color: Theme.of(context).cardColor,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Присоединяйся по ключу',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Тренируйся с друзьями или один',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    child: TextField(
                                      controller: _controller,
                                      onSubmitted: (value) {
                                        setState(() {
                                          _controller.text = value;
                                          print(_controller.text);
                                        });
                                      },
                                      decoration: myStyleTextField(
                                        context,
                                        labelText: 'Введите ключ',
                                        hintText: '123456',
                                        // helperText: 'Поле для поиска заметок',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        print('hello сюда закинуть событие');
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'Где взять ключ?',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Действующие тренировки',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text('View all'),
                      ],
                    ),
                    Text(
                      'Редактирование недоступно',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
              ScrollListSportsWorkoutModel(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Тренировки, созданные вами',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text('View all'),
                      ],
                    ),
                    Text(
                      'Доступно для редактирования',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
              AdminScrollListSportsWorkoutModel(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   static const id = '/';
//
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: tabBar.length, vsync: this);
//
//     // будем делать каждый раз перестроение, когда виджет меняетя
//     tabController.addListener(() {
//       print(tabController.index.toString());
//       setState(() {
//         currentTabIndex.value = tabController.index;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: MyLeftDrawer.openLeftDrawer(),
//         actions: [
//           MyEndDrawer.openEndDrawer(),
//         ],
//       ),
//       endDrawer: MyEndDrawer(),
//       end_drawer: MyLeftDrawer(),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           //перечисляем страницы, в соответсвии с количеством табов
//           Container(
//             alignment: Alignment.center,
//             color: Colors.green,
//             child: Text('1'),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.yellow,
//             child: Text('2'),
//
//             // Text(_tabBar[_currentTabIndex].title),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.purple,
//             child: Text('3'),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.purple,
//             child: Text('4'),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 20,
//         fixedColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.blueGrey,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           for (final item in tabBar)
//             BottomNavigationBarItem(icon: item.icon, label: item.title)
//         ],
//         onTap: (index) {
//           setState(() {
//             tabController.index = index;
//             currentTabIndex.value = index;
//           });
//         },
//         currentIndex: currentTabIndex.value,
//       ),
//     );
//   }
// }
