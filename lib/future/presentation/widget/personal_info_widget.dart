import 'package:flutter/material.dart';
import 'package:mega_intern/future/presentation/widget/primary_button.dart';
import 'package:mega_intern/future/presentation/widget/text_form_field_widget.dart';
import 'package:mega_intern/future/presentation/widget/text_with_icon_widget.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  final ValueNotifier<bool> isEditedProfileMode = ValueNotifier(true);

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
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black)),
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
                            initialValue: 'Don',
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
                            initialValue: 'Donov',
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
                            initialValue: 'DeniHero',
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
