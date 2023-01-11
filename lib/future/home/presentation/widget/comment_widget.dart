import 'package:flutter/material.dart';
import 'package:mega_intern/future/home/presentation/widget/write_comment_form_widget.dart';

import '../../../../theme/palette.dart';
import '../../../../theme/style.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget(
      {Key? key,
      required this.name,
      required this.lastName,
      required this.text})
      : super(key: key);

  final String name;
  final String lastName;
  final String text;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  ValueNotifier<bool> isOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOpen,
      builder: (context, _, __) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.name} ${widget.lastName}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
              width: 395, child: Text(widget.text, style: UBUNTU_16_400_GREY)),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '30.11.2022',
                  style: UBUNTU_16_400_GREY,
                ),
                TextButton(
                    onPressed: () {
                      isOpen.value = !isOpen.value;
                    },
                    child: Text(
                      'Ответить',
                      style: UBUNTU_16_400_PURPLE.copyWith(
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
          isOpen.value
              ? SizedBox(
                  height: 40,
                  width: 300,
                  child: Row(
                    children: [
                      Text(
                        'Вы',
                        style: UBUNTU_24_500_BLACK.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: PURPLE),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_upward_sharp,
                              color: WHITE,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
