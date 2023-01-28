import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/bloc/comment_post/comment_post_cubit.dart';

import '../../../../theme/palette.dart';
import '../../../../theme/style.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget(
      {Key? key, required this.commentModel, required this.postId})
      : super(key: key);

  final CommentModel commentModel;
  final int postId;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  ValueNotifier<bool> isOpen = ValueNotifier(false);
  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isOpen,
      builder: (context, _, __) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.commentModel.user!.name} ${widget.commentModel.user!.name}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
              width: 395,
              child:
                  Text(widget.commentModel.text!, style: Style.UBUNTU_16_400_GREY)),
          const SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '30.11.2022',
                  style: Style.UBUNTU_16_400_GREY,
                ),
                widget.commentModel.child != null
                    ? TextButton(
                        onPressed: () {
                          isOpen.value = !isOpen.value;
                        },
                        child: Text(
                          'Ответить',
                          style: Style.UBUNTU_16_400_PURPLE.copyWith(
                              decoration: TextDecoration.underline),
                        ),
                      )
                    : TextButton(onPressed: () {}, child: const Text('  '))
              ],
            ),
          ),
          isOpen.value
              ? SizedBox(
                  height: 40,
                  width: 300,
                  child: Row(
                    children: [
                      Text(
                        'Вы',
                        style: Style.UBUNTU_24_500_BLACK.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: TextFormField(
                          controller: commentController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if(commentController.text.isNotEmpty){
                            context.read<CommentPostCubit>().commentReplyPost(
                                widget.postId,
                                commentController.text,
                                widget.commentModel.id!);
                            FocusManager.instance.primaryFocus?.unfocus();
                            isOpen.value = !isOpen.value;
                          }else{
                            return;
                          }

                        },
                        child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Palette.PURPLE),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_upward_sharp,
                              color: Palette.WHITE,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
