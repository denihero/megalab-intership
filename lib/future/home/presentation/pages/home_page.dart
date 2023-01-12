import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/filter_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/future/widgets/svg_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../widget/burger_menu_widget.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            'assets/icons/megalab_icon.svg',
            color: WHITE,
          ),
          actions: [
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              onPressed: () {},
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/menu.svg'),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_news.png'),
                  fit: BoxFit.cover),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 17),
                  child: Text(
                    'Новости',
                    style: UBUNTU_42_400_WHITE.copyWith(
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
        ),
      ),
      endDrawer: const BurgerMenuWidget(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgIconButtonWidget(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                icon: SvgPicture.asset('assets/icons/sliders.svg'),
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
                    return const Center(
                      child: Expanded(child: CircularProgressIndicator()),
                    );
                  } else if (state is GetAllPostSuccess) {
                    final post = state.posts;
                    return ListView.separated(
                      itemCount: post.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return NewsCardWidget(
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
            const Align(
              alignment: Alignment.bottomCenter,
                child: FooterWidget()),
          ],
        ),
      ),
    );
  }
}
