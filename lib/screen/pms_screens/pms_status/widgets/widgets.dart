import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/font_res.dart';
import 'package:hrms_app/utils/image_res.dart';

Widget pmsBox(
    {required Color topColor, required int text, required String title}) {
  return Expanded(
    child: Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: const BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: topColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2), topRight: Radius.circular(2))),
            height: 20,
            width: 93,
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppTextStyle(
                  size: 11,
                  weight: FontWeight.w400,
                  fontFamily: FontRes.inter,
                  textColor: ColorRes.white),
            ),
          ),
          Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: Text(text.toString(),
                      style: AppTextStyle(
                          textColor: ColorRes.black,
                          fontFamily: FontRes.inter,
                          weight: FontWeight.w600,
                          size: 25))))
        ],
      ),
    ),
  );
}

Widget appBar(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  return Container(
      height: 80,
      width:width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageRes.blueBox),fit: BoxFit.cover),

      ),
      child: Row(
        children: [
          Container(
              width: 50,
              alignment: Alignment.center,
              child: Image.asset(
                ImageRes.backArrowIcon,
                height: 20,
              )),
          Text(
            "PMS",
            style: AppTextStyle(
                textColor: ColorRes.white,
                fontFamily: FontRes.inter,
                weight: FontWeight.w600,
                size: 18),
          ),
        ],
      ));
}
