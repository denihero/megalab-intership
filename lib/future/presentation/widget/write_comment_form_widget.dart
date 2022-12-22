import 'package:flutter/material.dart';

class WriteCommentFormWidget extends StatelessWidget {
  const WriteCommentFormWidget({Key? key}) : super(key: key);

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
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Напишите комментарий'),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(126, 91, 194, 1)),
            child: const Center(
              child: Icon(
                Icons.arrow_upward_sharp,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
