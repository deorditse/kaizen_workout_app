import 'package:flutter/material.dart';
import 'package:kaizen/packages/style_app/lib/src/style_text_field.dart';
import 'default_dialog_workout_search.dart';

class JoinByKey extends StatefulWidget {
  const JoinByKey({Key? key}) : super(key: key);

  @override
  State<JoinByKey> createState() => _JoinByKeyState();
}

class _JoinByKeyState extends State<JoinByKey> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
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
                            // controller: _controller,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                _controller.text = value;
                              });
                            },
                            onSubmitted: (value) {
                              // _controllerText?.value = value;
                              defaultDialogWorkoutSearch(
                                context: context,
                                idWorkout: value,
                              );
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
                              defaultDialogWorkoutSearch(
                                context: context,
                                idWorkout: _controller.text,
                              );
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
  }
}
