import 'dart:ui';
import 'package:flutter/material.dart';
Color primary = const Color(0xFF687daf);

class Styles{
  static Color primaryColor =primary;
  static Color textColor =const Color(0xFF3b3b3b);
  static Color bgcolor =const Color(0xFFeeedf2);
  static Color orange =const Color(0xFFF37B67);
  static Color registerLineText = Colors.black;
  static Color texttheme =const Color(0xFF526799);
  static Color LoginPageTxt = Colors.white;

  static TextStyle textStyle =TextStyle(fontSize: 16,color:textColor,fontWeight: FontWeight.w500);
  static TextStyle headlinestyle =TextStyle(fontSize: 26,color:textColor,fontWeight: FontWeight.bold);
  static TextStyle headlinestyle2 =TextStyle(fontSize: 21,color:textColor,fontWeight: FontWeight.bold);
  static TextStyle headlinestyle3 =TextStyle(fontSize: 17,color:textColor,fontWeight: FontWeight.w500);
  static TextStyle headlinestyle4 =TextStyle(fontSize: 14,color:Colors.grey.shade500,fontWeight: FontWeight.w500);
  static TextStyle registerLine = TextStyle(fontSize: 18,color:registerLineText,fontWeight: FontWeight.w500);
  static TextStyle text_Theme = TextStyle(fontSize: 18,color:texttheme,fontWeight: FontWeight.w500);
  static TextStyle LoginTxt = TextStyle(fontSize: 18,color:LoginPageTxt,fontWeight: FontWeight.w500);

}