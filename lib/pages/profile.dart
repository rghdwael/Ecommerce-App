import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/widgets/custom_button.dart';
import 'package:navigation_practice/widgets/custom_text_field.dart';
import '../theme/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userData});

  final UserData userData;

  @override
  State<ProfilePage> createState() => _StateProfile();
}

class _StateProfile extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  final _formKey = GlobalKey<FormState>();

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final bytes = await image.readAsBytes();

      widget.userData.updateProfileImage(bytes);
    }
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: widget.userData.name,
    );

    _emailController = TextEditingController(
      text: widget.userData.email,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                ListenableBuilder(
                  listenable: widget.userData,
                  builder: (context, child) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: pickProfileImage,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                widget.userData.profileImageBytes != null
                                    ? MemoryImage(
                                  widget.userData.profileImageBytes!,
                                )
                                    : null,
                                child:
                                widget.userData.profileImageBytes == null
                                    ? const Icon(
                                  Icons.person,
                                  size: 45,
                                )
                                    : null,
                              ),
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 14,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.userData.name!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          widget.userData.email,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tap your photo to change it',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                // Personal information card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      const SizedBox(height: 20),

                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              label: 'Name',
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty) {
                                  return 'Please enter a valid name!';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 20),

                            CustomTextField(
                              controller: _emailController,
                              label: 'Email',
                              validator: (value) {
                                if (value == null ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email!';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 24),

                            CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.userData.updateProfile(
                                    newName: _nameController.text.trim(),
                                    newEmail: _emailController.text.trim(),
                                  );
                                }
                              },
                              text: 'Save Changes',
                            ),
                          ],
                        ),
                      ),
                    ],
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
