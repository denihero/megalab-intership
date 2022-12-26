import 'package:flutter/material.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Фильтрация',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Спорт'),
                value: true,
                tristate: true,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (va) {

                }),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Политика'),
                value: false,
                tristate: true,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (va) {}),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Звезды'),
                value: false,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                tristate: true,
                onChanged: (va) {}),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Исскуства'),
                value: false,
                tristate: true,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (va) {}),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Мода'),
                value: false,
                tristate: true,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (va) {}),
            PrimaryButton(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text('Применить'),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
