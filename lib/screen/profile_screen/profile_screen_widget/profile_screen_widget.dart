import 'package:flutter/widgets.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';

Widget profileBox({String? image,text}) {
  return Container(
    decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: ColorRes.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: 
              const Offset(0, 0))
        ]),
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: ColorRes.skyBlue,
              borderRadius: BorderRadius.circular(10),
              ),
          child: Center(child: Image.asset(image!,height: 30,width: 30,)),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle(
              fontFamily: "inter",
              size: 18,
              weight: FontWeight.w500,
              textColor: ColorRes.darkBlue),
        )
      ],
    ),
  );
}
