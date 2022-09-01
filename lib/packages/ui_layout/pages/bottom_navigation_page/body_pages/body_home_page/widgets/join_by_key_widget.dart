import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_text_field.dart';

Widget JoinByKey() {
  TextEditingController _controller = TextEditingController();

  return Builder(
    builder: (context) {
      return Padding(
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
                                _controller.text = value;
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
      );
    },
  );
}
