import 'package:flutter/material.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/future/widgets/text_with_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';

import 'categories_widget.dart';

class WriteNewsWidget extends StatelessWidget {
  const WriteNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        width: 350,
        color: WHITE,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Text('Обложка новости'),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(WHITE),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: GREY)))),
                onPressed: () {},
                child: TextWithIconWidget(
                  text: 'Загрузить',
                  icon: const Icon(
                    Icons.file_download_outlined,
                    color: BLACK,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const TextFormFieldWidget(
              title: 'Загаловок',
              padding: EdgeInsets.zero,
              enabled: true,
              height: 35,
              borderRadius: 5,
              contentPadding: EdgeInsets.only(bottom: 5, left: 10),
            ),
            const TextFormFieldWidget(
              title: 'Краткое описание',
              padding: EdgeInsets.zero,
              enabled: true,
              height: 35,
              borderRadius: 5,
              contentPadding: EdgeInsets.only(bottom: 5, left: 10),
            ),
            const SizedBox(
                child: TextFormFieldWidget(
              title: 'Текст новости',
              padding: EdgeInsets.zero,
              enabled: true,
              borderRadius: 5,
              maxLines: null,
            )),
            const SizedBox(
              height: 15,
            ),
            const Text('Выбрать категорию'),
            const SizedBox(
              height: 5,
            ),
            const FilterSortButton(),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(child: const Text('Создать'), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
