import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{

  bool FavoriteButton = false;
  String? UserName;
  IconData IconColor =  Icons.favorite_border;

  void ChangeFavoriteIcon(bool value){

    FavoriteButton = value;

    if(FavoriteButton == false){
      IconColor = Icons.favorite_border;
    }else{
      IconColor = Icons.favorite;
    }

    notifyListeners();

  }

}