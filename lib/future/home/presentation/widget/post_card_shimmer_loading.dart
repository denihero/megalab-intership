import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostCardShimmerLoading extends StatelessWidget {
  const PostCardShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                color: Colors.white,
                width: 359,
                height: 252,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 26,
                bottom: 10
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  width: 250,
                  height: 20,
                  color: Colors.white,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 26, right: 10),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  width: 359,
                  height: 60,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
