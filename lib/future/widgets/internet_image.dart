import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mega_intern/core/common/string.dart';
import 'package:mega_intern/core/storage/storage.dart';
import 'package:mega_intern/future/home/presentation/widget/bounce_loading.dart';

class InternetImage extends StatefulWidget {
  const InternetImage({Key? key, required this.imageUrl, required this.width, required this.height}) : super(key: key);

  final String imageUrl;
  final double width;
  final double height;

  @override
  State<InternetImage> createState() => _InternetImageState();
}

class _InternetImageState extends State<InternetImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$apiUrl${widget.imageUrl}',
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
      httpHeaders: {
        'Token': '${SecureStorage.readData('mega')}'
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => const SpinKitDoubleBounce(color: Colors.blue,)
    );
  }
}
