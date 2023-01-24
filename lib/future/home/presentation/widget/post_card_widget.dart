import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_detail_post/get_detail_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_favourite/get_favourite_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/like_post/like_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/pages/detail_page.dart';
import 'package:mega_intern/future/home/presentation/widget/share_window_widget.dart';
import 'package:mega_intern/future/widgets/internet_image.dart';
import 'package:mega_intern/future/widgets/svg_icon_widget.dart';
import 'package:mega_intern/theme/style.dart';

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({Key? key, required this.post}) : super(key: key);

  final PostModel post;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  ValueNotifier<bool> isFavourite = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.read<GetDetailPostCubit>().getDetailPost(widget.post.id!);
        if (!mounted) return;
        Navigator.push(
              context,
            MaterialPageRoute(
                builder: (_) => DetailScreen(
                      post: widget.post,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: InternetImage(
                imageUrl: widget.post.image ?? '',
                width: 359,
                height: 272,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('31.12.2022', style: UBUNTU_16_400_GREY),
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
                        await context
                            .read<LikePostCubit>()
                            .likePost(widget.post.id!);
                        if(!mounted){
                          return !isFav;
                        }
                        context.read<GetFavouriteCubit>().getFavourite();
                        return !isFav;
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                widget.post.title!,
                style: UBUNTU_24_500_BLACK,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Text(
                widget.post.shortDesc != null
                    ? widget.post.shortDesc!
                    : widget.post.text!,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: UBUNTU_16_400_GREY,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailScreen(
                                post: widget.post,
                              )));
                },
                child: Text(
                  'Читать дальше>>',
                  style: UBUNTU_16_400_PURPLE.copyWith(
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SvgIconButtonWidget(
                icon: SvgPicture.asset('assets/icons/share.svg'),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ShareWidget();
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
