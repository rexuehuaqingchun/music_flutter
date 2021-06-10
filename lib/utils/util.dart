import 'package:flutter/material.dart';

double toRpx(BuildContext context, double size) {
  double rpx = MediaQuery.of(context).size.width / 750;
  return size * rpx;
}

String formCharCount(int count) {
  if (count == 0 || count.isNaN) {
    return '0';
  }
  String strCount = count.toString();
  if (strCount.length >= 5) {
    String prefix = strCount.substring(0, strCount.length - 4);
    if (strCount.length == 5) {
      prefix += '.${strCount[1]}';
    }
    if (strCount.length == 6) {
      prefix += '.${strCount[2]}';
    }
    return prefix + "w";
  }
  return strCount;
}
