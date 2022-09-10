import 'package:get/get.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/view/body_page/home_bottom_menu/home_bottomNavigationBar.dart';
import '../../../../storage/SharedPreferences/DataFromSharedPreference.dart';
import '../../../../storage/SharedPreferences/my_shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../controller/calendar_page_controller.dart';
import 'complex_example.dart';

TableBasicsController myListPageController = Get.find<TableBasicsController>();

BodyTableCalendar copyWithBodyTableCalendar(key) {
  return BodyTableCalendar(key: key);
}

class BodyTableCalendar extends StatefulWidget {
  const BodyTableCalendar({Key? key}) : super(key: key);

  @override
  _BodyTableCalendarState createState() => _BodyTableCalendarState();
}

class _BodyTableCalendarState extends State<BodyTableCalendar> {
  TextEditingController _controllerTextFieldUp =
      TextEditingController(text: "Тренировка на сегодняшний день");

  TextEditingController _controllerTextFieldDown = TextEditingController(
      text: "Опишите подробно задачу - нажмите, чтобы отредактировать");

  @override
  void initState() {
    super.initState();

    if (_controllerTextFieldUp.text == "" ||
        _controllerTextFieldUp.text == null) {
      _controllerTextFieldUp.text == "В этом поле кратко опишите задачу";
    }
    if (_controllerTextFieldDown.text == "" ||
        _controllerTextFieldUp.text == null) {
      _controllerTextFieldUp.text ==
          "Тут можно подробно расписать задачу со всеми комментариями";
    }

    getDataFromSharedPref().then((value) {
      SaveSharedPrefObject.getTextFieldUp(
              myListPageController.indexMyArrayBody.value)
          ?.then((value) {
        setState(() {
          _controllerTextFieldUp.text = value;
        });
      });
      SaveSharedPrefObject.getTextFieldDown(
              myListPageController.indexMyArrayBody.value)
          ?.then((value) {
        setState(() {
          _controllerTextFieldDown.text = value;
        });
      });
    });

    SaveSharedPrefObject.getStatisticsFromSelectDaysFromCalendars(
            myListPageController.indexMyArrayBody.value)
        ?.then((value) => myListPageController.valueSelectDays.value = value);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerTextFieldUp.dispose();
    _controllerTextFieldDown.dispose();
    FocusNode().dispose();
  }

  bool checkStatLocal = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 140,
              //flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: myStyleContainer(context: context),
                  //color Header
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            // border: Border(
                            //   bottom: BorderSide(
                            //     width: 1,
                            //     color: Colors.lightGreen,
                            //     style: BorderStyle.solid,
                            //   ),
                            // ),
                            // color: Colors.green.withOpacity(0.6),
                            ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            child: TextField(
                              //краткое описание задачи
                              controller: _controllerTextFieldUp,
                              onChanged: (value) {
                                setState(() {
                                  myListPageController
                                      .myStringMessageTextFieldUp.value = value;
                                  SaveSharedPrefObject.saveTextFieldUp(
                                      myListPageController
                                          .indexMyArrayBody.value,
                                      value);
                                });
                              },
                              onSubmitted: (_) {
                                FocusNode().dispose();
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 0),
                                border: InputBorder.none,
                                isDense: true,
                                hintStyle: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white70,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.green,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              //Заглавные для предложения
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              //  color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                  backgroundColor:
                                      Colors.green.withOpacity(0.4),
                                  titlePadding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  title: "Подробное описание задачи",
                                  content: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      height: 350,
                                      child: TextField(
                                        autofocus: true,
                                        textInputAction: TextInputAction.done,
                                        onChanged: (value) {
                                          setState(() {
                                            myListPageController
                                                .myStringMessageTextFieldDown
                                                .value = value;

                                            SaveSharedPrefObject
                                                .saveTextFieldDown(
                                                    myListPageController
                                                        .indexMyArrayBody.value,
                                                    value);
                                          });
                                        },
                                        onSubmitted: (_) {
                                          Get.close(1);
                                        },
                                        maxLines: 20,
                                        //  minLines: 5,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white54,
                                          filled: true,
                                          hintText: 'Подробное описание задачи',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.green,

                                        style: const TextStyle(
                                          color: Colors.black87,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        //Заглавные для предложения
                                        textAlign: TextAlign.left,
                                        controller: _controllerTextFieldDown,
                                      ),
                                    ),
                                  ),
                                  titleStyle: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    border: Border(
                                      top: BorderSide.none,
                                      left: BorderSide(
                                          width: 4.0, color: Colors.green),
                                      right: BorderSide.none,
                                      bottom: BorderSide.none,
                                    ),
                                    // color: Colors.black.withOpacity(0.05),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          "${myListPageController.myStringMessageTextFieldDown.value}",
                                          style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontSize: 14,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              //flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  decoration: myStyleContainer(context: context),
                  child: TableComplexExample(key: widget.key),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              key: widget.key,
              color: Colors.white70,
              // height: 200,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Статистика 🔥",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Количество выполнений за все время:',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    " ${myListPageController.valueSelectDays.value} ",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 100,
            ),
            HomeBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
