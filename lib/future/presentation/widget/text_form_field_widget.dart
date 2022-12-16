import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical:15,horizontal: 10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(228, 223, 220, 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(126, 91, 194, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
