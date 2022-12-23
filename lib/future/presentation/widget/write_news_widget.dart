import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mega_intern/future/presentation/widget/categories_widget.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';
import 'package:mega_intern/future/presentation/widget/text_form_field_widget.dart';
import 'package:mega_intern/future/presentation/widget/text_with_icon_widget.dart';

class WriteNewsWidget extends StatelessWidget {
  const WriteNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        width: 350,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(Icons.close,size: 30,),
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
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.grey)))),
                onPressed: () {},
                child: TextWithIconWidget(
                  text: 'Загрузить',
                  icon: const Icon(
                    Icons.file_download_outlined,
                    color: Colors.black,
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
            SizedBox(
              height: 15,
            ),
            Text('Выбрать категорию'),
            SizedBox(
              height: 5,
            ),
            const FilterSortButton(),
            SizedBox(
              height: 30,
            ),
            PrimaryButton(child: Text('Создать'), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
