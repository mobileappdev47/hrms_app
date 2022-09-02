import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';

Widget homeScreenTopContainer({String? icon,text1,text2,BuildContext? context}){
  final width = MediaQuery.of(context!).size.width;

  return Container(
    width: width*0.29,
    padding: const EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          blurRadius: 1.0,
          spreadRadius:.0,
          offset: const Offset(0.0, 1.0),

        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(icon!),
        const SizedBox(height: 5,),
        Text(text1,style: AppTextStyle(fontFamily: "inter",weight: FontWeight.w700,size: 30),),
        const SizedBox(height: 5,),
        Text(text2,style: AppTextStyle(fontFamily: "inter",weight: FontWeight.w600,size: 14),),
      ],
    ),
  );
}