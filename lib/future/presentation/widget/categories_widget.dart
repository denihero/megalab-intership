import 'package:flutter/material.dart';

class FilterSortButton extends StatefulWidget {
  const FilterSortButton({Key? key}) : super(key: key);

  @override
  State<FilterSortButton> createState() => _FilterSortButtonState();
}

class _FilterSortButtonState extends State<FilterSortButton> {
  String dropDownValue = 'Не выбрано';

  final items = <String>{
    'Не выбрано',
    'По возрастанию',
    'По снижению',
    'По рейтингу',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 400,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        elevation: 5,
        underline: const SizedBox(),
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        iconEnabledColor: Colors.black,
        alignment: Alignment.center,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        icon: Transform.translate(
          offset: const Offset(130, 0),
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 26,
          ),
        ),
        value: dropDownValue,
        items: items.map((String e) {
          return DropdownMenuItem<String>(
            alignment: Alignment.centerLeft,
            value: e,
            child: Text(
              e,
              textAlign: TextAlign.left,
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }
}
