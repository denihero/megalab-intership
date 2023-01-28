import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_intern/future/home/presentation/bloc/publish_post/publish_post_cubit.dart';
import 'package:mega_intern/future/widgets/primary_button.dart';
import 'package:mega_intern/future/widgets/text_form_field_widget.dart';
import 'package:mega_intern/future/widgets/text_with_icon_widget.dart';
import 'package:mega_intern/theme/palette.dart';

import '../../../widgets/blur_background_widget.dart';
import 'categories_widget.dart';

class WriteNewsWidget extends StatefulWidget {
  const WriteNewsWidget({Key? key}) : super(key: key);

  @override
  State<WriteNewsWidget> createState() => _WriteNewsWidgetState();
}

class _WriteNewsWidgetState extends State<WriteNewsWidget> {
  late final TextEditingController textController;
  late final TextEditingController titleController;

  String dropDownValue = 'Не выбрано';

  final ImagePicker picker = ImagePicker();
  File? imageFile;

  pickImage() async {
    try {
      final image =
          await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;
      setState(() {
        imageFile = File(image.path);
      });
    } catch (_) {}
  }

  @override
  void initState() {
    textController = TextEditingController();
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        width: 350,
        color: Palette.WHITE,
        child: BlocConsumer<PublishPostCubit, PublishPostState>(
          listener: (context, state) {
            if (state is PublishPostSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Публикация успешна создана"),
                ),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
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
                              backgroundColor: MaterialStateProperty.all(Palette.WHITE),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(color: Palette.GREY)))),
                          onPressed: () {},
                          child: TextWithIconWidget(
                            text: 'Загрузить',
                            icon: const Icon(
                              Icons.file_download_outlined,
                              color: Palette.BLACK,
                            ),
                            onPressed: () async {
                              await pickImage();
                            },
                          ),
                        ),
                      ),
                      TextFormFieldWidget(
                        title: 'Загаловок',
                        padding: EdgeInsets.zero,
                        enabled: true,
                        height: 35,
                        controller: titleController,
                        borderRadius: 5,
                        contentPadding:
                            const EdgeInsets.only(bottom: 5, left: 10),
                      ),
                      const TextFormFieldWidget(
                        title: 'Краткое описание',
                        padding: EdgeInsets.zero,
                        enabled: true,
                        height: 35,
                        borderRadius: 5,
                        contentPadding: EdgeInsets.only(bottom: 5, left: 10),
                      ),
                      TextFormFieldWidget(
                        title: 'Текст новости',
                        padding: EdgeInsets.zero,
                        enabled: true,
                        controller: textController,
                        borderRadius: 5,
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('Выбрать категорию'),
                      const SizedBox(
                        height: 5,
                      ),
                      FilterSortButton(
                        tagName: dropDownValue,
                        onChange: (String? newVal) {
                          setState(() {
                            dropDownValue = newVal!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        child: const Text('Создать'),
                        onPressed: () {
                          context.read<PublishPostCubit>().publishPost(
                              titleController.text,
                              textController.text,
                              imageFile,
                              dropDownValue);
                        },
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AbsorbPointer(
                    absorbing: context.read<PublishPostCubit>().isLoading,
                    child: context.read<PublishPostCubit>().isLoading
                        ? const BlurBackgroundWidget(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
