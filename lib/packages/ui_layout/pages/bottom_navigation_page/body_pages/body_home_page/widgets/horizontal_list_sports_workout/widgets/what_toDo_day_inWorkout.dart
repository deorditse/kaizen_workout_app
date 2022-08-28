import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/model/lib/model.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout/widgets/daily_workout_sheet/card_daily_workout_sheet.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/body_sports_page.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_text_field.dart';

class CardDailyWorkoutSheet extends StatefulWidget {
  CardDailyWorkoutSheet({Key? key, this.day, this.index}) : super(key: key);
  int? index;
  int? day;

  @override
  State<CardDailyWorkoutSheet> createState() => _CardDailyWorkoutSheetState();
}

class _CardDailyWorkoutSheetState extends State<CardDailyWorkoutSheet> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: GestureDetector(
        onTap: () {
          controllerSetting.currentTabIndex.value = 1;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Открыто задание на день ${widget.day! + 1}',
              style: Theme.of(context).textTheme.headline3,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide(
                          width: 4.0, color: Theme.of(context).primaryColor),
                      right: BorderSide.none,
                      bottom: BorderSide.none,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GetBuilder<ImplementAppStateGetXController>(
                          builder: (controllerApp) => Text(
                            controllerApp.dataSportsWorkoutList
                                .elementAt(widget.index!)
                                .descriptionWorkoutList[widget.day!],
                            // "Отжаться 50 раз",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
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
          ],
        ),
      ),
    );
  }
}

_methodDialog(context) {
  return Get.defaultDialog(
    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
    titlePadding: EdgeInsets.only(
      top: 20,
    ),
    title: "Описание задачи на день",
    content: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(0),
        height: MediaQuery.of(context).size.width,
        child: TextField(
          autofocus: true,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            // setState(() {
            //   myListPageController
            //       .myStringMessageTextFieldDown
            //       .value = value;
            //
            //   SaveSharedPrefObject
            //       .saveTextFieldDown(
            //       myListPageController
            //           .indexMyArrayBody.value,
            //       value);
            // });
          },
          onSubmitted: (_) {
            Get.close(1);
          },
          maxLines: 20,
          //  minLines: 5,
          decoration: const InputDecoration(
            fillColor: Colors.white54,
            filled: true,
            hintText: 'Подробно опишите задание на этот день тренировки',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black54,
            ),
          ),
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).primaryColor,

          style: const TextStyle(
            color: Colors.black87,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textCapitalization: TextCapitalization.sentences,
          //Заглавные для предложения
          textAlign: TextAlign.left,
          // controller: _controllerTextFieldDown,
        ),
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  );
}
