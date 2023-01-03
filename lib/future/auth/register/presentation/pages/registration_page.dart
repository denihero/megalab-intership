import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../../../login/presentation/page/login_page.dart';

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
          color: PURPLE,
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
            child: Text(
              'Регистрация',
              style: UBUNTU_16_500_WHITE,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Уже есть логин ? ',
                style: UBUNTU_13_400_BLACK,
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  style: const TextStyle(
                      color: BLUE, decoration: TextDecoration.underline),
                  text: 'Войти'),
            ])),
          )
        ],
      ),
    );
  }
}
