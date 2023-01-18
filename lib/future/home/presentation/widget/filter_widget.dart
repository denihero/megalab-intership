import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_all_tag/get_all_tag_cubit.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/theme/style.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Фильтрация',
                style: UBUNTU_24_500_BLACK.copyWith(fontSize: 18)),
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
                            return CheckboxListTile(
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(tag[index].name!),
                              value: true,
                              tristate: true,
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onChanged: (va) {},
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
                  style: UBUNTU_16_500_WHITE,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
