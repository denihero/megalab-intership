import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

import '../bloc/get_all_tag/get_all_tag_cubit.dart';

class FilterSortButton extends StatefulWidget {
  const FilterSortButton({Key? key, required this.tagName, required this.onChange}) : super(key: key);

  final String tagName;
  final Function(String? newVal) onChange;

  @override
  State<FilterSortButton> createState() => _FilterSortButtonState();
}

class _FilterSortButtonState extends State<FilterSortButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 400,
      decoration: BoxDecoration(
          border: Border.all(color: GREY),
          borderRadius: BorderRadius.circular(5)),
      child: BlocBuilder<GetAllTagCubit, GetAllTagState>(
        builder: (context, state) {
          if (state is GetAllTagSuccess) {
            final List<TagModel> list = state.allTag;
            return DropdownButton<String>(
              dropdownColor: WHITE,
              elevation: 5,
              underline: const SizedBox(),
              style: UBUNTU_15_500_BLACK,
              iconEnabledColor: BLACK,
              alignment: const Alignment(-0.9, 0.6),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              icon: Transform.translate(
                offset: const Offset(30, 0),
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 26,
                  color: Colors.black,
                ),
              ),
              value: widget.tagName,
              items: list.map((TagModel e) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.centerLeft,
                  value: e.name,
                  child: Text(
                    e.name!,
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList(),
              onChanged: widget.onChange
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
