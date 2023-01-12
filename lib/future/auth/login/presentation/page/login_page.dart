import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/auth/login/domain/usecases/login.dart';
import 'package:mega_intern/future/auth/login/presentation/bloc/login_cubit.dart';
import 'package:mega_intern/future/auth/register/presentation/pages/registration_page.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/home_page.dart';
import 'package:mega_intern/future/widgets/blur_background_widget.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

///TODO: Make Blur loading
class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController nicknameController;
  late final TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nicknameController = TextEditingController();
    passwordController = TextEditingController();
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
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginInitial ||
              state is LoginError ||
              state is LoginLoading) {
            return Form(
              key: _formKey,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldWidget(
                        enabled: true,
                        title: 'Никнейм',
                        controller: nicknameController,
                      ),
                      TextFormFieldWidget(
                        enabled: true,
                        obscureText: true,
                        title: 'Пароль',
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      PrimaryButton(
                        child: Text(
                          'Войти',
                          style: UBUNTU_16_500_WHITE,
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().loginCubit(
                              nicknameController.text, passwordController.text);
                        },
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
                                        builder: (context) =>
                                            const RegistrationScreen()),
                                  );
                                },
                              style: const TextStyle(
                                  color: BLUE,
                                  decoration: TextDecoration.underline),
                              text: 'Регистрация'),
                        ])),
                      )
                    ],
                  ),
                  context.read<LoginCubit>().isLoading
                      ? const Positioned.fill(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                              child: BlurBackgroundWidget(
                                  child: CircularProgressIndicator())))
                      : const SizedBox()
                ],
              ),
            );
          } else if (state is LoginSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<GetAllPostCubit>().getAllPosts();
              context.read<GetFavouriteCubit>().getFavourite();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
