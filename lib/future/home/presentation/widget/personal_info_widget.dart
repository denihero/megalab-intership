import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:mega_intern/core/common/string.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/future/widgets/text_with_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key, required this.userModel})
      : super(key: key);

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
    if (widget.userModel != null) {
      nameController = TextEditingController(text: widget.userModel!.name);
      nicknameController =
          TextEditingController(text: widget.userModel!.nickname);
      lastNameController =
          TextEditingController(text: widget.userModel!.lastName);
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
    final double width = MediaQuery.of(context).size.width;
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
                      widget.userModel?.profileImage != null
                          ? CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  '$apiUrl${widget.userModel!.profileImage!}'),
                            )
                          : ProfilePicture(
                              name:
                                  '${widget.userModel!.name} ${widget.userModel!.lastName}',
                              radius: 65,
                              fontsize: 40),
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
                            color: Palette.RED,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: width / 1.7,
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
                          width: width / 1.7,
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
                          width: width / 1.7,
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
