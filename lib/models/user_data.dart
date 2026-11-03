import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier{
  String? name ;
  String email;
  UserData({this.name,required this.email});

  void updateProfile({ String? newName,required String newEmail}){
    name=newName;
    email=newEmail;
    notifyListeners();
  }

}