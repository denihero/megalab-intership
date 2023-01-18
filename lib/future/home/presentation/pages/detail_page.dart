import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/pages/profile_page.dart';
import 'package:mega_intern/future/home/presentation/widget/burger_menu_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/share_window_widget.dart';
import 'package:mega_intern/future/widgets/internet_image.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../bloc/like_post/like_post_cubit.dart';
import '../widget/comment_list_widget.dart';
import '../../../widgets/svg_icon_widget.dart';
import '../widget/filter_widget.dart';
import '../widget/write_comment_form_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? topText;
  String? bottomText;
  String? generalText;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    generalText = widget.post.text!;
    if (generalText!.length > 180 && generalText != null) {
      topText = generalText!.substring(0, 180);
      bottomText = generalText!.substring(180);
    } else {
      topText = generalText;
      bottomText = generalText;
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: const BurgerMenuWidget(),
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const FilterWidget();
                      });
                },
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
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 17),
                    child: Text(
                      'Новости',
                      style: TextStyle(fontSize: 42, color: Colors.white),
                    ),
                  )),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 20, bottom: 8),
                  child: SvgIconButtonWidget(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '29.11.2022',
                          style: UBUNTU_16_400_GREY,
                        ),
                        LikeButton(
                            likeBuilder: (bool isLiked) {
                              return isLiked
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              )
                                  : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 30,
                              );
                            },
                            size: 35,
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            isLiked: widget.post.is_liked,
                            onTap: (isFav) async {
                              await context.read<LikePostCubit>().likePost(widget.post.id!);
                              return !isFav;
                            }),
                      ],
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Заголовок новости',
                          style: UBUNTU_24_500_BLACK,
                        )),
                    Text(
                      '''$topText''',
                      style: UBUNTU_16_400_GREY,
                    ),
                   InternetImage(imageUrl: widget.post.image ?? '', width: 400, height: 300),
                    Text(
                      '''$bottomText''',
                      style: UBUNTU_16_400_GREY,
                    ),
                    SvgIconButtonWidget(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      icon: SvgPicture.asset(
                        'assets/icons/share.svg',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ShareWidget();
                            });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Комментарий',
                      style: UBUNTU_24_500_BLACK,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RepaintBoundary(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.post.comment!.length,
                          itemBuilder: (context, index) {
                            return CommentListWidget(
                              commentModel: widget.post.comment![index]!,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 70, child: WriteCommentFormWidget()),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              const FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
