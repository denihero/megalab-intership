import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/presentation/pages/detail_page.dart';
import 'package:mega_intern/future/presentation/widget/share_window_widget.dart';
import 'package:mega_intern/future/presentation/widget/svg_icon_widget.dart';

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
            context, MaterialPageRoute(builder: (_) => DetailScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
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
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(133, 128, 128, 1),
                    ),
                  ),
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
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Text(
                description,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(133, 128, 128, 1)),
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
                child: const Text(
                  'Читать дальше>>',
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(126, 91, 194, 1)),
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
