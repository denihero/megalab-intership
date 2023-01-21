import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/core/storage/storage.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/burger_menu_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/general_app_bar.dart';
import 'package:mega_intern/future/home/presentation/widget/personal_info_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/write_news_widget.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/theme/style.dart';

import '../bloc/get_own_post/get_own_post_cubit.dart';
import '../widget/post_card_shimmer_loading.dart';
import '../widget/post_card_widget.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          String? author = await SecureStorage.readData('user');
          if (!mounted) return;
          context.read<GetOwnPostCubit>().getOwnPostCubit(author!);
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
              BlocBuilder<GetOwnPostCubit, GetOwnPostState>(
                builder: (context, state) {
                  if (state is GetOwnPostSuccess) {
                    final ownPost = state.ownPost;

                    return ownPost.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: ownPost.length,
                            itemBuilder: (context, index) {
                              return PostCardWidget(
                                post: ownPost[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 1.4,
                                indent: 20,
                                endIndent: 20,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'У вас нету своих статей',
                              style: UBUNTU_16_400_BLACK,
                            ),
                          );
                  } else if (state is GetOwnPostLoading) {
                    return ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index){
                        return const PostCardShimmerLoading();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 1.4,
                          indent: 20,
                          endIndent: 20,
                          color: Color.fromRGBO(217, 217, 217, 1),
                        );
                      },
                    );
                  } else if (state is GetOwnPostError) {
                    return const Center(
                      child: Text('Something get wrong'),
                    );
                  }

                  return const SizedBox();
                },
              ),
               FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
