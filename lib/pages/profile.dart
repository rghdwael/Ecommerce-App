<<<<<<< HEAD
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_practice/widgets/custom_button.dart';
import 'dart:typed_data';

import 'package:navigation_practice/widgets/custom_text_field.dart';

=======
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:navigation_practice/widgets/custom_button.dart';
import 'package:navigation_practice/widgets/custom_text_field.dart';
>>>>>>> Test_branch
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
<<<<<<< HEAD
  Uint8List? _imageBytes;

  Future<void> pickProfileImage()async{

    ImagePicker picker=ImagePicker();

    final XFile? image=await picker.pickImage(
        source: ImageSource.gallery);

    if (image!=null){
      final bytes=await image.readAsBytes();
      setState(() {
        _imageBytes=bytes;
      });
    }
  }
  @override
  void initState() {
    super.initState();
=======

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

>>>>>>> Test_branch
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
<<<<<<< HEAD
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
=======
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
>>>>>>> Test_branch
              children: [
                const SizedBox(height: 20),
                ListenableBuilder(
                  listenable: widget.userData,
                  builder: (context, child) {
<<<<<<< HEAD
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
=======
                    return Column(
>>>>>>> Test_branch
                      children: [
                        GestureDetector(
                          onTap: pickProfileImage,
                          child: Stack(
<<<<<<< HEAD
      
                              children: [
                                CircleAvatar(
                                radius: 55,
                                backgroundImage: _imageBytes!=null?
                                MemoryImage(_imageBytes!):null,
      
                                child: _imageBytes==null?
                                Icon(Icons.person):null,
                              ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                        radius: 14,
                                        child: Icon(Icons.camera_alt_outlined,size: 18,)))
                              ]
                          ),
                        ),
                        const SizedBox(width: 16),

                          Expanded(
                            child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade200)

                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Personal Information",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Divider(height: 24),

                                Text(
                                  "NAME",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.userData.name!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  "EMAIL ADDRESS",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.userData.email,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),

                          ),
                          )



=======
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
>>>>>>> Test_branch
                      ],
                    );
                  },
                ),
<<<<<<< HEAD
                SizedBox(height: 20),
                CustomTextField(
                  controller: _nameController,
                  label: "Edit your name:",
                  validator: (value){
                    if (value==null || value.trim().isEmpty)
                    { return "Please enter a valid name!";}
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  label: "Edit your email:",
                  validator:(value){
                    if (value==null || !value.contains('@'))
                    { return "Please enter a valid email!";}
                    return null;
                  } ,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    widget.userData.updateProfile(
                      newName: _nameController.text,
                      newEmail: _emailController.text,
                    );
                  },
                  text: "Save Changes",
=======

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
>>>>>>> Test_branch
                ),
              ],
            ),
          ),
<<<<<<< HEAD
        
      ),
    );
  }
}
=======
        ),
      ),
    );
  }
}
>>>>>>> Test_branch
