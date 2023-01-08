import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';
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
  late final TextEditingController nameController;
  late final TextEditingController surnameController;
  late final TextEditingController nicknameController;
  late final TextEditingController passwordController;
  late final TextEditingController password2Controller;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    surnameController = TextEditingController();
    nicknameController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    super.initState();
  }

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
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              child: Form(
                key: _formKey,
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterInitial) {
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormFieldWidget(
                                title: 'Имя',
                                controller: nameController,
                                enabled: true,
                              ),
                              TextFormFieldWidget(
                                title: 'Фамилия',
                                controller: surnameController,
                                enabled: true,
                              ),
                              TextFormFieldWidget(
                                title: 'Никнейм',
                                controller: nicknameController,
                                enabled: true,
                              ),
                              TextFormFieldWidget(
                                title: 'Пароль',
                                controller: passwordController,
                                enabled: true,
                              ),
                              TextFormFieldWidget(
                                title: 'Подтверждение пароля',
                                controller: password2Controller,
                                enabled: true,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              PrimaryButton(
                                child: Text(
                                  'Регистрация',
                                  style: UBUNTU_16_500_WHITE,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<RegisterCubit>().registerCubit(
                                        name: nameController.text,
                                        surname: surnameController.text,
                                        nickname: nicknameController.text,
                                        password: passwordController.text,
                                        password2: password2Controller.text);
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
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
                                                builder: (context) =>
                                                    const LoginScreen()),
                                          );
                                        },
                                      style: const TextStyle(
                                          color: BLUE,
                                          decoration: TextDecoration.underline),
                                      text: 'Войти'),
                                ])),
                              )
                            ],
                          ),
                        ],
                      );
                    } else if (state is RegisterSuccess) {
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      });
                      return const Center(
                          child: Text('Вы успешно зарегистрировались'));
                    } else if (state is RegisterLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
