import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_practice/widgets/custom_button.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  final UserData userData;

  const LoginForm({
    super.key,
    required this.userData,
  });

  @override
  State<LoginForm> createState() => _StateLoginForm();
}

class _StateLoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth:480),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'gleam',
                  style: GoogleFonts.caprasimo(
                    fontSize: 65,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                Text(
                  "Login to continue shopping",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _email,
                            label: "Email address:",
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _password,
                            label: "Password:",
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return "Please enter a valid password!";
                              }
                              return null;
                            },
                            obscure: true,
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.userData.updateProfile(
                                  newName: widget.userData.name,
                                  newEmail: _email.text,
                                );
                                context.go('/home');
                              }
                            },
                            text: "Login",
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Dont Have an account?"),
                              TextButton(
                                onPressed: () => context.go('/signup'),
                                child: const Text("Sign Up"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}