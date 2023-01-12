import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/bloc/get_user/get_user_cubit.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/future/widgets/text_with_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key, required this.userModel}) : super(key: key);

  final UserModel? userModel;

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  final ValueNotifier<bool> isEditedProfileMode = ValueNotifier(true);

  late final TextEditingController nameController;
  late final TextEditingController lastNameController;
  late final TextEditingController nicknameController;

  @override
  void initState() {
    if(widget.userModel != null) {
      nameController = TextEditingController(
        text: widget.userModel!.name
      );
      nicknameController = TextEditingController(
          text: widget.userModel!.nickname
      );
      lastNameController = TextEditingController(
          text: widget.userModel!.last_name
      );
    }


    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ValueListenableBuilder(
        valueListenable: isEditedProfileMode,
        builder: (context, _, __) => Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/474x/55/1f/ff/551fff636303fb8a696c213736ddc09e.jpg'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: !isEditedProfileMode.value,
                        child: TextWithIconWidget(
                          text: 'Добавить фото',
                          icon: const Icon(Icons.file_download_outlined),
                          onPressed: () {},
                        ),
                      ),
                      Visibility(
                        visible: !isEditedProfileMode.value,
                        child: TextWithIconWidget(
                          text: 'Удалить',
                          icon: const Icon(
                            Icons.delete_outline,
                            color: RED,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              foregroundColor:
                                  MaterialStateProperty.all(BLACK)),
                          onPressed: () {
                            isEditedProfileMode.value =
                                !isEditedProfileMode.value;
                          },
                          child: const Text('Edit Profile')),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 250,
                          child: TextFormFieldWidget(
                            title: 'Имя',
                            controller: nameController,
                            enabled: !isEditedProfileMode.value,
                            // suffixIcon: isEditedProfileMode.value == true
                            //     ? null
                            //     : const Icon(
                            //         Icons.edit,
                            //         size: 25,
                            //       ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                          )),
                      SizedBox(
                          width: 250,
                          child: TextFormFieldWidget(
                            title: 'Фамилия',
                            controller: lastNameController,
                            enabled: !isEditedProfileMode.value,
                            // suffixIcon: isEditedProfileMode.value == true
                            //     ? null
                            //     : const Icon(
                            //         Icons.edit,
                            //         size: 25,
                            //       ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                          )),
                      SizedBox(
                          width: 250,
                          child: TextFormFieldWidget(
                            title: 'Никнейм',
                            controller: nicknameController,
                            enabled: !isEditedProfileMode.value,
                            // suffixIcon: isEditedProfileMode.value == true
                            //     ? null
                            //     : const Icon(
                            //         Icons.edit,
                            //         size: 25,
                            //       ),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: !isEditedProfileMode.value,
                        child: SizedBox(
                          width: 200,
                          height: 40,
                          child: PrimaryButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text('Сохранить'),
                            onPressed: () {
                              isEditedProfileMode.value =
                                  !isEditedProfileMode.value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
