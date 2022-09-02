// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hrms_app/utils/color_res.dart';

TextStyle AppTextStyle({
  FontWeight? weight,
  double? size,
  Color? textColor,
  TextDecoration? textDecoration,
  String? fontFamily,
}) {
  return TextStyle(
    fontWeight: weight ?? FontWeight.normal,
    fontSize: size ?? 16,
    color: textColor ?? ColorRes.blackText,
    fontFamily: fontFamily ?? "inter",
    decoration: textDecoration ?? TextDecoration.none,
  );
}
