import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:mega_intern/core/common/image.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/bloc/comment_post/comment_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/profile_page.dart';
import 'package:mega_intern/future/home/presentation/widget/burger_menu_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/home/presentation/widget/share_window_widget.dart';
import 'package:mega_intern/future/widgets/blur_background_widget.dart';
import 'package:mega_intern/future/widgets/internet_image.dart';
import 'package:mega_intern/locator_service.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../bloc/get_all_post/get_all_post_cubit.dart';
import '../bloc/get_detail_post/get_detail_post_cubit.dart';
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

class _DetailScreenState extends State<DetailScreen>
    with AutomaticKeepAliveClientMixin {
  String? topText;
  String? bottomText;
  String? generalText;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              AssetsIcon.megaLab,
              color: Palette.WHITE,
            ),
            actions: [
              SvgIconButtonWidget(
                icon: SvgPicture.asset(
                  AssetsIcon.search,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const FilterWidget();
                      });
                },
              ),
              SvgIconButtonWidget(
                icon: SvgPicture.asset(
                  AssetsIcon.profile,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
              ),
              SvgIconButtonWidget(
                icon: SvgPicture.asset(
                  AssetsIcon.menu,
                ),
                onPressed: () {
                  context.read<GetAllPostCubit>().getAllPosts();
                  context.read<GetFavouriteCubit>().getFavourite();
                  _scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AssetsIcon.news,
                    ),
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
        body: BlocProvider<CommentPostCubit>(
          create: (context) =>  sl<CommentPostCubit>(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 20, bottom: 8),
                    child: SvgIconButtonWidget(
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        AssetsIcon.arrowLeft,
                      ),
                      onPressed: () {
                        context.router.pop();
                        context.read<GetFavouriteCubit>().getFavourite();
                      },
                    ),
                  ),
                ),
                BlocConsumer<CommentPostCubit, CommentPostState>(
                  listener: (context, state) {
                    if (state is CommentPostSuccess) {
                      commentController.text = '';
                      context
                          .read<GetDetailPostCubit>()
                          .getDetailPost(widget.post.id!);
                    }
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '29.11.2022',
                                      style: Style.UBUNTU_16_400_GREY,
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
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 10),
                                        isLiked: widget.post.isLiked,
                                        onTap: (isFav) async {
                                          await context
                                              .read<LikePostCubit>()
                                              .likePost(widget.post.id!);
                                          return !isFav;
                                        }),
                                  ],
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Заголовок новости',
                                      style: Style.UBUNTU_24_500_BLACK,
                                    )),
                                Text(
                                  '''$topText''',
                                  style: Style.UBUNTU_16_400_GREY,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InternetImage(
                                    imageUrl: widget.post.image ?? '',
                                    width: 400,
                                    height: 300),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '''$bottomText''',
                                  style: Style.UBUNTU_16_400_GREY,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SvgIconButtonWidget(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  icon: SvgPicture.asset(
                                    AssetsIcon.share,
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
                                  style: Style.UBUNTU_24_500_BLACK,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                BlocBuilder<GetDetailPostCubit,
                                    GetDetailPostState>(
                                  builder: (context, state) {
                                    if (state is GetDetailPostSuccess) {
                                      final detailPost = state.detailPost;
                                      return RepaintBoundary(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                detailPost.comment!.length,
                                            itemBuilder: (context, index) {
                                              return CommentListWidget(
                                                commentModel:
                                                    detailPost.comment![index]!,
                                                postId: widget.post.id!,
                                              );
                                            }),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 70,
                                    child: WriteCommentFormWidget(
                                      postId: widget.post.id!,
                                      commentController: commentController,
                                    )),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: AbsorbPointer(
                            absorbing:
                                context.read<CommentPostCubit>().isLoading,
                            child: context.read<CommentPostCubit>().isLoading
                                ? const BlurBackgroundWidget(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const FooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
