import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/authentication_page/controller/google_auth_controller.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_text_field.dart';

import '../controller/email_auth_controller.dart';
import '../utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        successMessage = true;
      });
      Get.put(EmailAuthController());
      // EmailAuthController.instance.login(
      //   _emailController.text.trim(),
      //   _passwordController.text.trim(),
      // );
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: Key('fieldEmail'),
            //for testing
            validator: (value) {
              print(_emailController.text);
              if (value == '') return 'Введите email';
              if (!validateEmail(value!)) //проверка на совпадения символам
                return 'Поле email содержит недопустимые символы';
              return null;
            },
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: myStyleTextField(
              context,
              labelText: 'Email',
              hintText: 'test@test.com',
              // helperText: 'Поле для поиска заметок',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            key: const Key('fieldPassword'),
            validator: (value) {
              if (value == '') return 'Введите пароль';
              //if (value.length.toInt() > 11) return 'Некорректный номер телефона';
              return null;
            },
            decoration: myStyleTextField(
              context,
              labelText: 'Пароль',
              hintText: '*****',
              // helperText: 'Поле для поиска заметок',
            ),
            keyboardType: TextInputType.visiblePassword,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter,
            ],
            obscureText: true,
          ),
          ElevatedButton(
            child: Text('Войти'),
            onPressed: _submit,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              // Get.put(GoogleAuthController());
              // GoogleAuthController.instance.signInWithGoogle();
            },
            child: const Text("Sign In with Google"),
          ),
          if (successMessage) Text('Добро пожаловать!'),
        ],
      ),
    );
  }
}
