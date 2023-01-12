import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/general_app_bar.dart';
import 'package:mega_intern/future/home/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/theme/style.dart';

import '../widget/footer_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GeneralAppBar(drawerKey: _scaffoldKey),
      body: SingleChildScrollView(
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetFavouriteError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is GetFavouriteSuccess) {
                    final fav = state.fav;
                    return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.fav.length,
                        itemBuilder: (context, index) {
                          return NewsCardWidget(
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
                        });
                  }
                  return const SizedBox();
                },
              ),
            ),
            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
