import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/core/common/image.dart';
import 'package:mega_intern/future/auth/register/presentation/bloc/register_cubit.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/locator_service.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../../../../widgets/blur_background_widget.dart';
import '../../../login/presentation/page/login_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _nicknameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _password2Controller;
  late final ScrollController _scrollController;
  late final FocusNode _nicknameFocusNode;
  late final FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _nicknameController = TextEditingController();
    _passwordController = TextEditingController();
    _password2Controller = TextEditingController();
    _scrollController = ScrollController();
    _nicknameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
    _password2Controller.dispose();
    _scrollController.dispose();
    _nicknameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        title: SvgPicture.asset(
          AssetsIcon.megaLab,
          color: Palette.PURPLE,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider<RegisterCubit>(
        create: (context) => sl<RegisterCubit>(),
        child: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                child: Form(
                  key: _formKey,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                          ),
                        );
                      } else if (state is RegisterSuccess) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        });
                      }
                    },
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormFieldWidget(
                                title: 'Имя',
                                controller: _nameController,
                                height: 45,
                                enabled: true,
                              ),
                              TextFormFieldWidget(
                                title: 'Фамилия',
                                controller: _surnameController,
                                enabled: true,
                                height: 45,
                              ),
                              TextFormFieldWidget(
                                title: 'Никнейм',
                                controller: _nicknameController,
                                enabled: true,
                                height: 45,
                                focusNode: _nicknameFocusNode,
                                onEditComplete: () {
                                  _scrollController.animateTo(120,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                  _nicknameFocusNode.nextFocus();
                                },
                              ),
                              TextFormFieldWidget(
                                title: 'Пароль',
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                enabled: true,
                                height: 45,
                                obscureText: true,
                                onEditComplete: () {
                                  _scrollController.animateTo(220,
                                      duration:
                                      const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                  _passwordFocusNode.nextFocus();
                                },
                              ),
                              TextFormFieldWidget(
                                title: 'Подтверждение пароля',
                                controller: _password2Controller,
                                enabled: true,
                                height: 45,
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              PrimaryButton(
                                child: Text(
                                  'Регистрация',
                                  style: Style.UBUNTU_16_500_WHITE,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (_passwordController.text ==
                                        _password2Controller.text) {
                                      context
                                          .read<RegisterCubit>()
                                          .registerCubit(
                                              name: _nameController.text,
                                              surname: _surnameController.text,
                                              nickname:
                                                  _nicknameController.text,
                                              password:
                                                  _passwordController.text,
                                              password2:
                                                  _password2Controller.text);
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Password is not match"),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Уже есть логин ? ',
                                    style: Style.UBUNTU_13_400_BLACK,
                                  ),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()),
                                          );
                                        },
                                      style: const TextStyle(
                                          color: Palette.BLUE,
                                          decoration: TextDecoration.underline),
                                      text: 'Войти'),
                                ])),
                              )
                            ],
                          ),
                          Positioned.fill(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: AbsorbPointer(
                              absorbing:
                                  context.read<RegisterCubit>().isLoading,
                              child: context.read<RegisterCubit>().isLoading
                                  ? const BlurBackgroundWidget(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
