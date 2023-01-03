import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/home/presentation/pages/detail_page.dart';
import 'package:mega_intern/future/home/presentation/widget/share_window_widget.dart';
import 'package:mega_intern/future/widgets/svg_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.isFavourite})
      : super(key: key);

  final String title;
  final String description;
  final String date;
  final bool isFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const DetailScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 359,
                height: 272,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/wall.png',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: UBUNTU_16_400_GREY),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: isFavourite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                title,
                style: UBUNTU_24_500_BLACK,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Text(
                description,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const DetailScreen()));
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
