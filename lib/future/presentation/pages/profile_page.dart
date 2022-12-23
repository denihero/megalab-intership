import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_intern/future/presentation/widget/footer_widget.dart';
import 'package:mega_intern/future/presentation/widget/news_card_widget.dart';
import 'package:mega_intern/future/presentation/widget/personal_info_widget.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';
import 'package:mega_intern/future/presentation/widget/write_news_widget.dart';

import '../widget/svg_icon_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          'assets/icons/megalab_icon.svg',
          color: Color.fromRGBO(128, 81, 194, 1),
        ),
        actions: [
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
          SvgIconButtonWidget(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Color.fromRGBO(128, 81, 194, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 19,top: 15),
              child: PersonalInfoWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, right: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Мои публикаций',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: PrimaryButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(context: context, builder: (context){
                          return WriteNewsWidget();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context,index){
                  return NewsCardWidget(
                      title: 'Some news title',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                      date: '',
                      isFavourite: false);
                },
              separatorBuilder: (context,index){
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