import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';

class UserType {
  static Map enType = {
    "NORMAL_USER": 'NORMAL_USER',
    "DQ_SINGER": 'DQ_SINGER',
    "DQ_OFFICIAL_ACCOUNT": 'DQ_OFFICIAL_ACCOUNT',
    "ADMIN": 'ADMIN',
  };

  static Map cnType = {
    "NORMAL_USER": '普通用户',
    "DQ_SINGER": '歌手',
    "DQ_OFFICIAL_ACCOUNT": '音乐号',
    "ADMIN": '管理员',
  };

  static Map colorType = {
    "NORMAL_USER": AppColors.unactive,
    "DQ_SINGER": AppColors.info,
    "DQ_OFFICIAL_ACCOUNT": AppColors.success,
    "ADMIN": AppColors.danger,
  };

  static String formCn(String type) {
    return cnType[type] ?? "游客";
  }

  static String formEn(String type) {
    return enType[type] ?? "游客";
  }

  static Color formColor(String type) {
    return colorType[type] ?? AppColors.unactive;
  }

  static bool isNormal(String type) => type == enType['NORMAL_USER'];  
  static bool isSinger(String type) => type == enType['DQ_SINGER'];  
  static bool isOfficial(String type) => type == enType['DQ_OFFICIAL_ACCOUNT'];  
  static bool isAdmin(String type) => type == enType['ADMIN'];  
}
