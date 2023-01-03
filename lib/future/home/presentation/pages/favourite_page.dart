import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/home/presentation/widget/news_card_widget.dart';

import '../../../widgets/svg_icon_widget.dart';
import '../widget/footer_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/icons/megalab_icon.svg',
          color: const Color.fromRGBO(128, 81, 194, 1),
        ),
        actions: [
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: const Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: const Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: const Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Избранные новости',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SingleChildScrollView(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const NewsCardWidget(
                        title: 'Какая та хуйня',
                        description: 'Тоже какая хуйня с описанием',
                        date: 'я хуй знает',
                        isFavourite: true);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1.4,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    );
                  }),
            ),
            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
