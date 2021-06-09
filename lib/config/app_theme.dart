import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.page,
  splashColor: Colors.transparent, // 取消水波纹效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: AppColors.unactive, // 文字颜色
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.active,
    unselectedItemColor: AppColors.unactive,
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.nav,
    elevation: 0,
  ),
  // tabbar的样式
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColors.unactive,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 18,
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 12),
  ),
  indicatorColor: AppColors.active, // 选项卡栏中所选选项卡指示器的颜色。
);