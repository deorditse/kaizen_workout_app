import 'package:flutter/material.dart';
import '../components/login_form.dart';
import '../components/register_form.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  static const String id = '/login_view';

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FormType _formType = FormType.login;

  _switchForm() {
    setState(() {
      _formType =
          _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //чтобы при появлениии клавиатуры не сьезжали виджеты
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _formType == FormType.login ? 'Вход' : 'Регистрация',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _formType == FormType.login
                          ? LoginForm()
                          : RegisterForm(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formType == FormType.login
                          ? 'Еще нет аккаунта? '
                          : 'Уже есть аккаунт?',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: _formType == FormType.login
                                  ? 'Регистрация'
                                  : 'Войти',
                            ),
                          ],
                        ),
                      ),
                      onPressed: _switchForm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
