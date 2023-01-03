import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_intern/future/home/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

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
          color: PURPLE,
        ),
        actions: [
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: PURPLE,
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: PURPLE,
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: PURPLE,
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
            Text(
              'Избранные новости',
              style: UBUNTU_30_500_BLACK,
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
