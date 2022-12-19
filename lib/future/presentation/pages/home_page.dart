import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/future/presentation/widget/svg_icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(163),
        child: AppBar(
          elevation: 0,
          title: SvgPicture.asset(
            'assets/icons/megalab_icon.svg',
            color: Colors.white,
          ),
          actions: [
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              onPressed: () {},
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              onPressed: () {},
            ),
            SvgIconButtonWidget(
              icon: SvgPicture.asset('assets/icons/menu.svg'),
              onPressed: () {},
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
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgIconButtonWidget(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              icon: SvgPicture.asset('assets/icons/sliders.svg'),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const NewsCardWidget(
                  title: 'Заголок новости',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                  date: '29.11.2022',
                  isFavourite: true,
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
            ),
          )
        ],
      ),
    );
  }
}