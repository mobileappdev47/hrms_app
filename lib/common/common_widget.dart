import 'package:flutter/material.dart';

import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/image_res.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: width * 0.8,
        child: Column(
          children: [
            Container(
              height: height * 0.45,
              decoration: BoxDecoration(
                  color: ColorRes.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: -5,
                        child: Image.asset(
                          ImageRes.sideTop,
                          fit: BoxFit.fill,
                          width:width*0.8,
                          height: height * 0.3,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 33),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorRes.orange,
                                  ColorRes.darkBlue,
                                ]),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(ImageRes.profile))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sidebarBox(text: "20", text1: "Present",context: context),
                        sidebarBox(text: "02", text1: "Absent",context: context),
                        sidebarBox(text: "01", text1: "Late",context: context),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                profileBox(ImageRes.empProfile, "Employee Profile"),
                profileBox(ImageRes.notificationProfile, "Notification"),
                profileBox(ImageRes.termsProfile, "Employee Profile"),
                profileBox(ImageRes.privacyIcon, "Privacy Policy"),
                profileBox(ImageRes.appLockIcon, "App lock System"),
              ],
            ),

            Container(
              width: width*0.5,
              padding: const EdgeInsets.symmetric(horizontal:50 ,vertical: 10),
              decoration: BoxDecoration(
                  color: ColorRes.orangeLight,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "Logout",
                  style: AppTextStyle(
                      textColor: Colors.white, fontFamily: "inter"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget sidebarBox({String? text, text1,BuildContext? context}) {
  final width = MediaQuery.of(context!).size.width;

  return Container(
    width: width * 0.2,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2), offset: const Offset(0, 2))
        ]),
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: AppTextStyle(
              fontFamily: "inter",
              size: 17,
              weight: FontWeight.w700,
              textColor: ColorRes.blueIcon),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text1,
          style: AppTextStyle(
              fontFamily: "inter",
              size: 12,
              weight: FontWeight.w600,
              textColor: ColorRes.greyText),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget profileBox(String icon, text) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    margin: const EdgeInsets.only(bottom: 30),
    child: Row(
      children: [
        Image.asset(icon),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: AppTextStyle(weight: FontWeight.w500, size: 14),
        )
      ],
    ),
  );
}
