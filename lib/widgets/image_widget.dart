import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{
  final double? height;

  const ImageWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Image.asset('images/hero_image.jfif',
=======
    return Image.asset('assets/images/hero_image.jfif',
>>>>>>> Test_branch
      fit: BoxFit.contain,
      height: height,
      width: double.infinity,);
  }
}