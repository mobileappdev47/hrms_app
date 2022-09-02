import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';

Widget commonTextFormField(
    {InputDecoration? inputDecoration,
    Icon? iconData,
    bool? isObscure,
    TextEditingController? controller}) {
  return Stack(
    children: [
      Container(
        height: 60,
        margin: const EdgeInsets.only(left: 30, top: 5),
        padding: const EdgeInsets.only(left: 50, top: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 0))
            ]),
        child: TextFormField(
          controller: controller,
          obscureText: isObscure ?? false,
          style: AppTextStyle(
              fontFamily: "inter", size: 15, textColor: ColorRes.blackText),
          decoration: inputDecoration,
        ),
      ),
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 1.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 0))
            ]),
        child: Center(child: iconData),
      ),
    ],
  );
}

Widget commonSocialButton({String? image}) {
  return Container(
   height: 50,
    width: 80,
    decoration:  BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 1.0,
          spreadRadius: 1.0,
          offset: const Offset(0,0)
        )
      ]
    ),
    child: SizedBox(
      height: 20,
        width: 20,
        child: Image.asset(image!,width: 20,height: 20,)),
  );
}
