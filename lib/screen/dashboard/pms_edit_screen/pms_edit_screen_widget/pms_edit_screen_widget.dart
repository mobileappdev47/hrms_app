import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';

List<Widget> generateChildren({
  List? text,
  List? selectedText,
  Function(String)? onTap,
}) {
  List<Widget> items = [];
  for (int i = 0; i <= 3; i++) {
    items.add(dimensionChips(
        text: text![i],
        isActive: selectedText!.contains(text[i]),
        onTap: onTap));
  }
  return items;
}

Widget dimensionChips({String? text, bool? isActive, Function(String)? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(right: 5, bottom: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isActive == true ? ColorRes.greenDark : ColorRes.grey),
    child: InkWell(
      onTap: () => onTap!(text!),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text!,
            style: AppTextStyle(
                textColor:
                    isActive == true ? ColorRes.white : ColorRes.blackText,
                fontFamily: "inter",
                size: 14),
          ),
          if (isActive == true)
            Row(
              children: const [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                )
              ],
            )
          else
            const SizedBox()
        ],
      ),
    ),
  );
}
