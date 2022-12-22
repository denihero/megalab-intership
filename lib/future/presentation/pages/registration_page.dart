import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/presentation/pages/sign_in_page.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';

import '../widget/text_form_field_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        title: SvgPicture.asset(
          'assets/icons/megalab_icon.svg',
          color: const Color.fromRGBO(126, 91, 194, 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextFormFieldWidget(
            title: 'Фамилия',
          ),
          const TextFormFieldWidget(
            title: 'Имя',
          ),
          const TextFormFieldWidget(
            title: 'Никнейм',
          ),
          const TextFormFieldWidget(
            title: 'Пароль',
          ),
          const TextFormFieldWidget(
            title: 'Подтверждение пароля',
          ),
          const SizedBox(
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
                style: TextStyle(
                    color: Color.fromRGBO(90, 90, 90, 1), fontSize: 13),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    },
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
