import 'package:flutter/material.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/theme/app_colors.dart';
import 'package:navigation_practice/widgets/login_form.dart';
import 'package:navigation_practice/widgets/image_widget.dart';

class Login extends StatefulWidget{
  const Login({super.key,required this.userData});
  final UserData userData;

  @override
  State<Login> createState()=>StateLogin();

}
class StateLogin extends State<Login>{

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 700;


    return Scaffold(
      backgroundColor: AppColors.background,

        body:SafeArea(

          child: isWide
              ? Row(
            children: [
              Expanded(child: ImageWidget()),
              Expanded(child: LoginForm(userData: widget.userData)),
            ],
          )
              : SingleChildScrollView(
            child: Column(
              children: [
                ImageWidget(height: 220),
                LoginForm(userData: widget.userData),
              ],
            ),
          ),
        )

    );
  }
}