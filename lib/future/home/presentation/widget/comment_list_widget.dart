import 'package:flutter/material.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/widget/comment_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class CommentListWidget extends StatelessWidget {
  const CommentListWidget(
      {Key? key, required this.commentModel, required this.postId})
      : super(key: key);

  final CommentModel commentModel;
  final int postId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommentWidget(
          commentModel: commentModel,
          postId: postId,
        ),
        ListView.builder(
            itemCount: commentModel.child!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(40, 0),
                    child: SizedBox(
                      width: 300,
                      child: CommentWidget(
                        commentModel: commentModel.child![index]!,
                        postId: postId,
                      ),
                    ),
                  ),
                ],
              );
            })
      ],
    );
  }
}
