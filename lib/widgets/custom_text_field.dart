import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;

  const CustomTextField({super.key,
     required this.label,
    required this.controller,required this.validator,
    this.obscure=false });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(labelText:label),
      controller: controller,
      obscureText: obscure,
      validator: validator,
    );
  }


}