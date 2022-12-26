import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/presentation/pages/favourite_page.dart';
import 'package:mega_intern/future/presentation/pages/profile_page.dart';
import 'package:mega_intern/future/presentation/pages/sign_in_page.dart';
import 'package:mega_intern/future/presentation/widget/filter_widget.dart';
import 'package:mega_intern/future/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/future/presentation/widget/svg_icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(163),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
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
      endDrawer: Drawer(
        width: 200,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Мой профиль'),
              leading: const Icon(Icons.person_outline),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Избранные новости'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const FavouriteScreen()));
              },
            ),
            const Spacer(),
            ListTile(
              title: const Text('Выйти'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                  ModalRoute.withName('/'),
                );
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgIconButtonWidget(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                icon: SvgPicture.asset('assets/icons/sliders.svg'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const FilterWidget();
                      });
                },
              ),
            ),
            ListView.separated(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return const NewsCardWidget(
                  title: 'Заголок новости',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
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
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
