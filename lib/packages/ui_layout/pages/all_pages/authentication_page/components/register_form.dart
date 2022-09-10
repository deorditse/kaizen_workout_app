import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import '../utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      //сначала проверим прохождение валидации
      setState(() {
        _isSuccess = true;
      });
      // EmailAuthController.instance.register(
      //     _emailController.text.trim(), _passwordController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('fieldName'), //for testing
            decoration: myStyleTextField(
              context,
              labelText: 'Имя',
              // hintText: '*****',
              // helperText: 'Поле для поиска заметок',
            ),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            key: Key('fieldLastName'),
            decoration: myStyleTextField(
              context,
              labelText: 'Фамилия',
              // hintText: '*****',
              // helperText: 'Поле для поиска заметок',
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            key: Key('fieldPhone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: myStyleTextField(
              context,
              labelText: 'Телефон',
              hintText: '89252776324',
              // helperText: 'Поле для поиска заметок',
            ),
            // validator: (value) {
            //   if (value == '') return 'Заполните поле телефон';
            //   return null;
            // },
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _emailController,
            key: Key('fieldEmail'),
            decoration: myStyleTextField(
              context,
              labelText: 'Email',
              hintText: 'test@test.com',
              // helperText: 'Поле для поиска заметок',
            ),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) return 'Емейл не корректный';
              return null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _passwordController,
            key: const Key('fieldPassword'),
            validator: (value) {
              if (value == '') return 'Введите пароль от 6 символов';
              if (value!.split('').length < 6 || value!.split('').length > 15)
                return 'Некорректный пароль';
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
          SizedBox(height: 10,),
          ElevatedButton(
            child: Text('Зарегистрироваться'),
            onPressed: _handleSubmit,
          ),
          const SizedBox(height: 30),
          if (_isSuccess) Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
