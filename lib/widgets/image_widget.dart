import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{
  final double? height;

  const ImageWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/hero_image.jfif',
      fit: BoxFit.contain,
      height: height,
      width: double.infinity,);
  }
}