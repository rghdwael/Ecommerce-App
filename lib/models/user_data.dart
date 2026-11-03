import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier{
  String? name ;
  String email;
  Uint8List? profileImageBytes;
  UserData({this.name,required this.email,this.profileImageBytes,});

  void updateProfileImage(Uint8List imageBytes) {
    profileImageBytes = imageBytes;
    notifyListeners();
  }

  void updateProfile({ String? newName,required String newEmail}){
    name=newName;
    email=newEmail;
    notifyListeners();
  }

}