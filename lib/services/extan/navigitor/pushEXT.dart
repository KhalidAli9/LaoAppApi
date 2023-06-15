import 'package:flutter/material.dart';

extension nav on BuildContext {
  pushAndRemove({required Widget view}) {
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => view), (route) => false);
  }

  pushpage(Widget widget) {
    Navigator.push(this, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  get pop => Navigator.of(this).pop();
  get width => MediaQuery.of(this).size.width;
  get height => MediaQuery.of(this).size.height;
}



