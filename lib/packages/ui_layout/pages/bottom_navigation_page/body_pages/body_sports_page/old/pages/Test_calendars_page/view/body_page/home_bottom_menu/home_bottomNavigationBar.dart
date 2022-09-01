import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../storage/SharedPreferences/DataFromSharedPreference.dart';
import '../../../../../storage/SharedPreferences/my_shared_preferences.dart';
import '../../../../../storage/hive/hive_data_for_tableCalendar.dart';
import '../../../../../storage/hive/hive_date_for_button_menu.dart';
import '../../../../../style.dart';
import '../../../controller/calendar_page_controller.dart';
import '../../../utils.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationBarState createState() =>
      _HomeBottomNavigationBarState();
}

TableBasicsController myListPageController = Get.find<TableBasicsController>();

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
   int selectedIndex = 0;

  double buttonHight = 45;

  double buttonwidth = 90;

  var mediumNameAdd;
  var mediumNameRename;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataHiveForButtonMenu.getDataHiveForButtonMenuList()
        .then((value) => myListPageController.myListNamePage.value = value);
    getDataFromSharedPref()
        .then((value) =>
            selectedIndex = myListPageController.indexMyArrayBody.value)
        .then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: Platform.isIOS
            ? EdgeInsets.only(bottom: 35.0, top: 3)
            : EdgeInsets.only(bottom: 5.0, top: 3),
        //отступ для разных платформ
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: buttonHight,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: myListPageController.myListNamePage.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            child: GestureDetector(
                              // key:
                              //     Key(myListPageController.myListNamePage[index]),
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                myListPageController.indexMyArrayBody.value =
                                    selectedIndex;
                                SaveSharedPrefObject.saveSelectedIndex(
                                    myListPageController
                                        .indexMyArrayBody.value);
                               //getDataFromSharedPref();

                                ///отображаю данные дня первого и меняю kFirstDay
                                setState(() {
                                  kFirstDay =
                                      myListPageController.kFirstDayList[
                                          myListPageController
                                              .indexMyArrayBody.value];
                                });

                                print(
                                    "this is my tap ON TAB ${myListPageController.myListNamePage[index]}");
                                print("my Index ${index}");
                              },
                              onLongPress: () async {
                                setState(() {
                                  selectedIndex = index;
                                });
                                myListPageController.indexMyArrayBody.value =
                                    index;
                                SaveSharedPrefObject.saveSelectedIndex(index);
                                //menu
                                Get.defaultDialog(
                                  backgroundColor: backColorAlertDialog,
                                  titleStyle: TextStyle(
                                    fontSize: fontSizeShowDialog,
                                    color:
                                        titleColorAlertDialog.withOpacity(0.8),
                                  ),
                                  title:
                                      "${myListPageController.myListNamePage[myListPageController.indexMyArrayBody.value]}",
                                  //menu
                                  titlePadding: EdgeInsets.only(top: 30),
                                  content: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.close(1);

                                            Get.defaultDialog(
                                              backgroundColor:
                                                  backColorAlertDialog,
                                              titleStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green),
                                              title: "Переименовать страницу:",
                                              titlePadding:
                                                  EdgeInsets.only(top: 30),
                                              content: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      initialValue:
                                                          "${myListPageController.myListNamePage[myListPageController.indexMyArrayBody.value]}",
                                                      autofocus: true,
                                                      //controller: _controllerTextFieldNameMenu,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          mediumNameRename =
                                                              value;
                                                        });
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20),
                                                        border:
                                                            InputBorder.none,
                                                        isDense: true,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      cursorColor: Colors.green,
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.white,
                                                        //fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      //Заглавные для предложения
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Get.close(1);
                                                          },
                                                          child: Text("отмена"),
                                                          style:
                                                              myButtonStyleFromShowDialog(),
                                                        ),
                                                        const SizedBox(
                                                          width: 40,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            int indexSel =
                                                                myListPageController
                                                                    .indexMyArrayBody
                                                                    .value;

                                                            myListPageController
                                                                        .myListNamePage[
                                                                    indexSel] =
                                                                mediumNameRename ??
                                                                    "${myListPageController.myListNamePage[indexSel]}";

                                                            DataHiveForButtonMenu
                                                                .saveDataHiveForButtonMenulist(
                                                                    myListPageController
                                                                        .myListNamePage);

                                                            SaveSharedPrefObject
                                                                .saveSelectedIndex(
                                                                    indexSel);

                                                            SaveSharedPrefObject
                                                                .saveSelectedIndex(
                                                                    myListPageController
                                                                        .indexMyArrayBody
                                                                        .value);
                                                            getDataFromSharedPref();

                                                            Get.close(1);
                                                          },
                                                          child:
                                                              Text("сохранить"),
                                                          style:
                                                              myButtonStyleFromShowDialog(),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("Переименовать"),
                                          style: myButtonStyleFromShowDialog(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.close(0);

                                            //deletePage
                                            Get.defaultDialog(
                                              backgroundColor:
                                                  backColorAlertDialog,
                                              titleStyle: TextStyle(
                                                  fontSize: fontSizeShowDialog,
                                                  color: titleColorAlertDialog),
                                              title: "Удалить страницу ?",
                                              titlePadding:
                                                  EdgeInsets.only(top: 30),
                                              content: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        SaveSharedPrefObject
                                                            .saveSelectedIndex(
                                                                index);
                                                        Get.close(1);
                                                      },
                                                      child: Text("No"),
                                                      style:
                                                          myButtonStyleFromShowDialog(),
                                                    ),
                                                    const SizedBox(
                                                      width: 40,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        if (myListPageController
                                                                .myListNamePage
                                                                .length >
                                                            1) {
                                                          setState(() {
                                                            selectedIndex =
                                                                index - 1;
                                                          });
                                                          myListPageController
                                                                  .indexMyArrayBody
                                                                  .value =
                                                              selectedIndex;

                                                          removeAllDataForPageFromSharedPref(
                                                              index);
                                                          Get.close(1);
                                                          SaveSharedPrefObject
                                                              .saveSelectedIndex(
                                                                  selectedIndex);

                                                          myListPageController
                                                              .kFirstDayList
                                                              .value
                                                              .removeAt(index);

                                                          DataFromHiveForTableCalendar
                                                              .savekFirstDayListCalendar(
                                                                  myListPageController
                                                                      .kFirstDayList
                                                                      .value);

                                                          setState(() {
                                                            kFirstDay = myListPageController
                                                                    .kFirstDayList[
                                                                myListPageController
                                                                    .indexMyArrayBody
                                                                    .value];
                                                          });
                                                        } else if (myListPageController
                                                                .myListNamePage
                                                                .length ==
                                                            1) {
                                                          //тут просто очищаю все места
                                                          setState(() {
                                                            selectedIndex = 0;
                                                          });

                                                          myListPageController
                                                              .indexMyArrayBody
                                                              .value = 0;
                                                          // myListPageController
                                                          //     .myListNamePage
                                                          //     .clear();
                                                          removeAllDataForPageFromSharedPref(
                                                              0);
                                                          Get.close(1);
                                                          SaveSharedPrefObject
                                                              .saveSelectedIndex(
                                                                  0);

                                                          DataHiveForButtonMenu
                                                              .saveDataHiveForButtonMenulist(
                                                                  myListPageController
                                                                      .myListNamePage);

                                                          myListPageController
                                                              .kFirstDayList
                                                              .value
                                                              .removeAt(0);

                                                          DataFromHiveForTableCalendar
                                                              .savekFirstDayListCalendar(
                                                                  myListPageController
                                                                      .kFirstDayList
                                                                      .value);

                                                          setState(() {
                                                            kFirstDay = myListPageController
                                                                    .kFirstDayList[
                                                                myListPageController
                                                                    .indexMyArrayBody
                                                                    .value];
                                                          });

                                                          print(
                                                              "система хочет удалить 1-ый инлдекс");
                                                        }
                                                      },
                                                      child: Text("Yes"),
                                                      style:
                                                          myButtonStyleFromShowDialog(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("Удалить"),
                                          style: myButtonStyleFromShowDialog(),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.close(1);
                                          },
                                          child: Text(
                                            "отмена",
                                            style: TextStyle(
                                                color: Colors.white54),
                                          ),
                                          // style: myButtonStyleFromShowDialog(),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },

                              child: Container(
                                //width: Min,
                                constraints: BoxConstraints(minWidth: 100),

                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(7),
                                  border: index == selectedIndex
                                      ? Border(
                                          top: BorderSide.none,
                                          left: BorderSide.none,
                                          right: BorderSide.none,
                                          bottom: BorderSide(
                                            width: 2.0,
                                            color: Colors.white54,
                                          ),
                                        )
                                      : null,
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '${myListPageController.myListNamePage[index]}',
                                    // 'Страница ${index + 1}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                            color: index == selectedIndex
                                ? buttonStateColorChoise
                                : buttonStateColor,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: IconButton(
                  color: Colors.green,
                  iconSize: 30,
                  onPressed: () {
                    addNewPage() {
                      //функция добавления новой смтраницы

                      int index = myListPageController.myListNamePage.length;

                      myListPageController.myListNamePage.add(mediumNameAdd ??
                          "Страница ${myListPageController.myListNamePage.length + 1}");

                      DataHiveForButtonMenu.saveDataHiveForButtonMenulist(
                          myListPageController.myListNamePage);
                      setState(() {
                        selectedIndex = index;
                      });

                      SaveSharedPrefObject.saveSelectedIndex(index);

                      // myListPageController.myListPage
                      //     .add(ValueKey(selectedIndex + 1));

                      myListPageController.indexMyArrayBody.value = index;

                      /// Create method для того чтобы гетить состояние страницы или это достаточно делать в init?
                      getDataFromSharedPref();

                      print(
                          "Save My element ADD ${myListPageController.myListNamePage}");

                      print(
                          "страница сохранена в массив $myListPageController.myListNamePage");

                      myListPageController.kFirstDayList.value
                          .add(DateTime.now());
                      DataFromHiveForTableCalendar.savekFirstDayListCalendar(
                          myListPageController.kFirstDayList.value);

                      setState(() {
                        kFirstDay = myListPageController.kFirstDayList[
                            myListPageController.indexMyArrayBody.value];
                      });

                      print(
                          "print from buttom navigator ${myListPageController.kFirstDayList.value}");
                    }

                    ///
                    ///
                    ///
                    ///
                    ///
                    Get.defaultDialog(
                      backgroundColor: backColorAlertDialog,
                      titleStyle: TextStyle(fontSize: 16, color: Colors.green),
                      title: "Добавить страницу?",
                      titlePadding: EdgeInsets.only(top: 30),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            /// проверить и добавить по именам, чтобы можно было save and delete
                            ///

                            TextField(
                              autofocus: true,
                              //controller: _controllerTextFieldNameMenu,

                              onChanged: (value) {
                                setState(() {
                                  mediumNameAdd = value;
                                });
                              },

                              onSubmitted: (value) {
                                addNewPage();
                                Get.close(1);
                              },
                              decoration: InputDecoration(
                                hintText: "название страницы...",
                                hintStyle: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white54,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.green,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              //Заглавные для предложения
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.close(1);
                                  },
                                  child: Text("отмена"),
                                  style: myButtonStyleFromShowDialog(),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    addNewPage();
                                    Get.close(1);
                                  },
                                  child: Text("добавить"),
                                  style: myButtonStyleFromShowDialog(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
