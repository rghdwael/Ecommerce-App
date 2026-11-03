import 'dart:io';

import 'package:flutter/material.dart';
import 'package:navigation_practice/models/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_practice/widgets/custom_button.dart';
import 'dart:typed_data';

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
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListenableBuilder(
                  listenable: widget.userData,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: pickProfileImage,
                          child: Stack(
      
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



                      ],
                    );
                  },
                ),
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
                ),
              ],
            ),
          ),
        
      ),
    );
  }
}