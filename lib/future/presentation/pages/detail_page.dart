import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/presentation/widget/footer_widget.dart';

import '../widget/svg_icon_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      const Text(
                        '29.11.2022',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(133, 128, 128, 1)),
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Заголовок новости',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      )),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Image.network(
                    'https://static.independent.co.uk/2022/11/12/20/poster.jpgwidth720?quality=50&width=640&auto=webp',
                    width: 359,
                    height: 232,
                  ),
                  const Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
                    Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.
                    Nam pulvinar blandit velit, id condimentum diam faucibus at. Aliquam lacus nisi, sollicitudin at nisi nec, fermentum congue felis. Quisque mauris dolor, fringilla sed tincidunt ac, finibus non odio. Sed vitae mauris nec ante pretium finibus. Donec nisl neque, pharetra ac elit eu, faucibus aliquam ligula. Nullam dictum, tellus tincidunt tempor laoreet, nibh elit sollicitudin felis, eget feugiat sapien diam nec nisl. Aenean gravida turpis nisi, consequat dictum risus dapibus a. Duis felis ante, varius in neque eu, tempor suscipit sem. Maecenas ullamcorper gravida sem sit amet cursus. Etiam pulvinar purus vitae justo pharetra consequat. Mauris id mi ut arcu feugiat maximus. Mauris consequat tellus id tempus aliquet.''',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),

                  SvgIconButtonWidget(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    icon: SvgPicture.asset('assets/icons/share.svg',width: 28,height: 28,),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),

            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
