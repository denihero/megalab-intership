import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/general_app_bar.dart';
import 'package:mega_intern/future/home/presentation/widget/post_card_widget.dart';
import 'package:mega_intern/theme/style.dart';

import '../widget/burger_menu_widget.dart';
import '../widget/footer_widget.dart';
import '../widget/post_card_shimmer_loading.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: GeneralAppBar(drawerKey: _scaffoldKey),
        endDrawer: const BurgerMenuWidget(),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<GetFavouriteCubit>().getFavourite();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Избранные новости',
                  style: UBUNTU_30_500_BLACK,
                ),
                SingleChildScrollView(
                  child: BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
                    builder: (context, state) {
                      if (state is GetFavouriteLoading) {
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
                      } else if (state is GetFavouriteError) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else if (state is GetFavouriteSuccess) {
                        final fav = state.fav;
                        return fav.isNotEmpty
                            ? ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: state.fav.length,
                                itemBuilder: (context, index) {
                                  return PostCardWidget(
                                    post: fav[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    thickness: 1.4,
                                    indent: 20,
                                    endIndent: 20,
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  );
                                })
                            : Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'У вас нету любимых постов',
                                      style: UBUNTU_16_400_BLACK,
                                    ),
                                    const SizedBox(
                                      height: 400,
                                    ),
                                  ],
                                ),
                            );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                const FooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
