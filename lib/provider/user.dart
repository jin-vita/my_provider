import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String? name;
  int? count;

  User({
    this.name,
    this.count,
  });

  void setData({name, count}) {
    this.name = name;
    this.count = count;
  }

  void applyData({name, count}) {
    setData(
      name: name,
      count: count,
    );
    notifyListeners();
  }
}
