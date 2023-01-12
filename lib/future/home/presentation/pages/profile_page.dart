import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/burger_menu_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/general_app_bar.dart';
import 'package:mega_intern/future/home/presentation/widget/personal_info_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/write_news_widget.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/theme/style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: GeneralAppBar(
        drawerKey: _scaffoldKey,
      ),
      endDrawer: const BurgerMenuWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 15),
              child: BlocBuilder<GetUserCubit, GetUserState>(
                builder: (context, state) {
                  if (state is GetUserSuccess) {
                    return PersonalInfoWidget(
                      userModel: state.user,
                    );
                  } else if (state is GetUserError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is GetUserLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Мои публикаций',
                    style: UBUNTU_24_500_BLACK,
                  ),
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: PrimaryButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const WriteNewsWidget();
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const SizedBox();
                // return const NewsCardWidget(
                //     title: 'Some news title',
                //     description:
                //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                //     date: '',
                //     isFavourite: false);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.4,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(217, 217, 217, 1),
                );
              },
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
