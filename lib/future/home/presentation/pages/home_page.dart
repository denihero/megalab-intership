import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/core/storage/storage.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/search_delegate_page.dart';
import 'package:mega_intern/future/home/presentation/widget/filter_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/post_card_shimmer_loading.dart';
import 'package:mega_intern/future/home/presentation/widget/post_card_widget.dart';
import 'package:mega_intern/future/widgets/svg_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../../../../core/common/image.dart';
import '../bloc/get_all_tag/get_all_tag_cubit.dart';
import '../bloc/get_own_post/get_own_post_cubit.dart';
import '../widget/burger_menu_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String nickname;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetAllPostCubit>().getAllPosts();
      context.read<GetFavouriteCubit>().getFavourite();
      context.read<GetUserCubit>().getUser();
      context.read<GetAllTagCubit>().getAllTag();
      nickname = (await SecureStorage.readData('user'))!;
      if (!mounted) return;
      context.read<GetOwnPostCubit>().getOwnPostCubit(nickname);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(163),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            AssetsIcon.megaLab,
            color: Palette.WHITE,
          ),
          actions: [
            SvgIconButtonWidget(
              icon: SvgPicture.asset(AssetsIcon.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchDelegatePage(),
                );
              },
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset(AssetsIcon.profile),
              onPressed: () {
                context.router.pushNamed('/profile-screen');
              },
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset(AssetsIcon.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsIcon.news), fit: BoxFit.cover),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 17),
                  child: Text(
                    'Новости',
                    style: Style.UBUNTU_42_400_WHITE
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                )),
          ),
        ),
      ),
      endDrawer: const BurgerMenuWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetAllPostCubit>().getAllPosts();
          context.read<GetFavouriteCubit>().getFavourite();
          context.read<GetUserCubit>().getUser();
          context.read<GetAllTagCubit>().getAllTag();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgIconButtonWidget(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  icon: SvgPicture.asset(AssetsIcon.sliders),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const FilterWidget();
                        });
                  },
                ),
              ),
              SizedBox(
                child: BlocBuilder<GetAllPostCubit, GetAllPostState>(
                  builder: (context, state) {
                    if (state is GetAllPostLoading) {
                      return ListView.separated(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
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
                    } else if (state is GetAllPostSuccess) {
                      final post = state.posts;
                      return ListView.separated(
                        itemCount: post.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return PostCardWidget(
                            post: post[index],
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
                      );
                    } else if (state is GetAllPostError) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
