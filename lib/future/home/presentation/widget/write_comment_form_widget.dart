import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/theme/palette.dart';

import '../bloc/comment_post/comment_post_cubit.dart';

class WriteCommentFormWidget extends StatefulWidget {
  const WriteCommentFormWidget({Key? key, required this.postId, required this.commentController})
      : super(key: key);

  final int postId;
  final TextEditingController commentController;

  @override
  State<WriteCommentFormWidget> createState() => _WriteCommentFormWidgetState();
}

class _WriteCommentFormWidgetState extends State<WriteCommentFormWidget> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextFormField(
                controller: widget.commentController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Напишите комментарий'),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if(widget.commentController.text.isNotEmpty){
              context
                  .read<CommentPostCubit>()
                  .commentPost(widget.postId, widget.commentController.text);
              FocusManager.instance.primaryFocus?.unfocus();
              widget.commentController.clear();

            }else{
              return;
            }

          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Palette.PURPLE),
            child: const Center(
              child: Icon(
                Icons.arrow_upward_sharp,
                color: Palette.WHITE,
              ),
            ),
          ),
        )
      ],
    );
  }
}
