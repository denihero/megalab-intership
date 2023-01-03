import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/auth/register/presentation/pages/registration_page.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextFormFieldWidget(
            enabled: true,
            title: 'Никнейм',
          ),
          const TextFormFieldWidget(
            enabled: true,
            obscureText: true,
            title: 'Пароль',
          ),
          const SizedBox(
            height: 32,
          ),
          PrimaryButton(
            child: Text(
              'Войти',
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
                text: 'Нету аккаунта ? ',
                style: UBUNTU_13_400_BLACK,
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()),
                      );
                    },
                  style: const TextStyle(
                      color: BLUE, decoration: TextDecoration.underline),
                  text: 'Регистрация'),
            ])),
          )
        ],
      ),
    );
  }
}
