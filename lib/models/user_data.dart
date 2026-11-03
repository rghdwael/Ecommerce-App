<<<<<<< HEAD
=======
import 'dart:typed_data';
import 'package:flutter/material.dart';
>>>>>>> Test_branch
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier{
  String? name ;
  String email;
<<<<<<< HEAD
  UserData({this.name,required this.email});
=======
  Uint8List? profileImageBytes;
  UserData({this.name,required this.email,this.profileImageBytes,});

  void updateProfileImage(Uint8List imageBytes) {
    profileImageBytes = imageBytes;
    notifyListeners();
  }
>>>>>>> Test_branch

  void updateProfile({ String? newName,required String newEmail}){
    name=newName;
    email=newEmail;
    notifyListeners();
  }

}