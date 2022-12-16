import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';

import '../widget/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: SvgPicture.asset(
          'assets/icons/megalab_icon.svg',
          color: Color.fromRGBO(126, 91, 194, 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            title: 'Фамилия',
          ),
          TextFormFieldWidget(
            title: 'Имя',
          ),
          TextFormFieldWidget(
            title: 'Никнейм',
          ),
          TextFormFieldWidget(
            title: 'Пароль',
          ),
          TextFormFieldWidget(
            title: 'Подтверждение пароля',
          ),
          SizedBox(
            height: 32,
          ),
          PrimaryButton(
            child: const Text(
              'Регистрация',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onPressed: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: RichText(
                text: TextSpan(children: [
              const TextSpan(
                text: 'Уже есть логин ? ',
                style:
                    TextStyle(color: Color.fromRGBO(90, 90, 90, 1), fontSize: 13),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: const TextStyle(
                      color: Color.fromRGBO(45, 78, 194, 1),
                      decoration: TextDecoration.underline),
                  text: 'Войти'),
            ])),
          )
        ],
      ),
    );
  }
}
