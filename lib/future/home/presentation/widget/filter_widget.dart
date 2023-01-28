import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_post/get_all_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_tag/get_all_tag_cubit.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/theme/style.dart';

import '../../data/model/home_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? tagName;
  int? choiceIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Фильтрация',
                style: Style.UBUNTU_24_500_BLACK.copyWith(fontSize: 18)),
            BlocBuilder<GetAllTagCubit, GetAllTagState>(
              builder: (context, state) {
                if (state is GetAllTagSuccess) {
                  final tag = state.allTag;
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: 200,
                      height: 400,
                      child: ListView.builder(
                          itemCount: tag.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Wrap(
                              spacing: 10,
                              children: techChips(index, tag),
                            );
                          }),
                    ),
                  );
                } else if (state is GetAllTagLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetAllTagError) {
                  return const Center(
                    child: Text('Something get wrong'),
                  );
                }
                return const SizedBox();
              },
            ),
            PrimaryButton(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Применить',
                  style: Style.UBUNTU_16_500_WHITE,
                ),
                onPressed: () {
                  context.read<GetAllPostCubit>().filterAllPosts(tagName ?? '');
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  List<Widget> techChips(int index, List<TagModel> tag) {
    List<Widget> chips = [];
    for (int i = 0; i < tag.length; i++) {
      Widget item = CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        selected: choiceIndex == i,
        title: Text(tag[i].name!),
        onChanged: (isSelected) {
          setState(() {
              if (isSelected!) {
                choiceIndex = i;
                tagName = tag[i].name!;
              } else {
              }
            },
          );
        },
        value: choiceIndex == i,
      );
      chips.add(item);
    }
    return chips;
  }
}
