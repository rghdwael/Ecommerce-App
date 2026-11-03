import 'package:flutter/material.dart';
import 'package:navigation_practice/models/user_data.dart';
import '../theme/app_colors.dart';
import '../widgets/image_widget.dart';
import '../widgets/signup_form.dart';


class Signup extends StatefulWidget{
  const Signup({super.key,required this.userData});

  final UserData userData;
  @override
  State<Signup> createState()=>StateSignup();

}
class StateSignup extends State<Signup>{

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 700;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: isWide
            ? Row(
          children: [
            Expanded(child: ImageWidget()),
            Expanded(child: SignupForm(userData: widget.userData)),
          ],
        )
            : Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 400,
              child: ImageWidget(height: 400),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 260),
                    SignupForm(userData: widget.userData),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}