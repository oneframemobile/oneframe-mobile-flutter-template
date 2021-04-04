import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final welcomeTextStyle = TextStyle(
    color: Color(0xff1a1a1a),
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: ScreenUtil.instance.setSp(64));

final titleNormalTextStyle = TextStyle(
    color: Color(0xff1a1a1a),
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: ScreenUtil.instance.setSp(60));

const loginButtonStyle = TextStyle(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 16);

const loginButtonStyle2 = TextStyle(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 22);


const tabTextStyle = TextStyle(
    color: Color(0xffffffff),
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 16.0);

final hyperTextStyle = TextStyle(
    color: Color(0xff767676),
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: ScreenUtil.instance.setSp(36));

final hyperBlueTextStyle = TextStyle(
    color: Color(0xff1e88e5),
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: ScreenUtil.instance.setSp(36));

const tabUnselectedTextStyle = const TextStyle(
    color: const Color(0xffffffff),
    fontWeight: FontWeight.w200,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: 16.0);

final forgotTextStyle = TextStyle(
    color: const Color(0xffc9c9c9),
    fontWeight: FontWeight.w400,
    fontFamily: "Poppins",
    fontStyle: FontStyle.normal,
    fontSize: ScreenUtil(allowFontScaling: true).setSp(32));

textStyle(BuildContext context) {
  final forgotTextStyle = TextStyle(
      color: const Color(0xffc9c9c9),
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
      fontStyle: FontStyle.normal,
      fontSize: 12);

  return forgotTextStyle;
}
