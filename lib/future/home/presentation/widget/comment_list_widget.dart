import 'package:flutter/material.dart';
import 'package:mega_intern/future/home/data/model/home_model.dart';
import 'package:mega_intern/future/home/presentation/widget/comment_widget.dart';
import 'package:mega_intern/theme/palette.dart';
import 'package:mega_intern/theme/style.dart';

class CommentListWidget extends StatelessWidget {
  const CommentListWidget({Key? key, required this.commentModel})
      : super(key: key);

  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommentWidget(
            name: commentModel.user!.name!,
            lastName: commentModel.user!.last_name!,
            text: commentModel.text!),
        ListView.builder(
            itemCount: commentModel.child!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(40, 0),
                    child: SizedBox(
                      width: 300,
                      child: CommentWidget(
                        name: commentModel.child![index]!.user!.name!,
                        lastName: commentModel.child![index]!.user!.last_name!,
                        text: commentModel.child![index]!.text!,
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
