import 'package:flutter/material.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Олег Петров',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
            width: 395,
            child: Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.''',
                style: UBUNTU_16_400_GREY)),
        SizedBox(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '30.11.2022',
                style: UBUNTU_16_400_GREY,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ответить',
                    style: UBUNTU_16_400_PURPLE.copyWith(
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
        ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Transform.translate(
                offset: const Offset(40, 0),
                child: SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Олег Петров',
                        style: UBUNTU_16_500_WHITE.copyWith(
                            fontSize: 18, color: BLACK),
                      ),
                      SizedBox(
                          width: 325,
                          child: Text(
                              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.''',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: GREY))),
                      SizedBox(
                        width: 180,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '30.11.2022',
                              style: UBUNTU_16_400_GREY,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Ответить',
                                  style: UBUNTU_16_400_PURPLE.copyWith(
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
