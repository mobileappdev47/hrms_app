import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/image_res.dart';

Stack bottomNavigationBar(
  BuildContext context,
  Function(int) onTap,
  pageIndex,

) {
  final width = MediaQuery.of(context).size.width;

  return Stack(
    fit: StackFit.loose,
    children: [
      SizedBox(
        height: 70,
        child: Container(
          height: 65,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.only(top: 19),
          decoration: const BoxDecoration(
            color: ColorRes.white,
            // border: Border(top: BorderSide(color: Color(0xffFFFFFF))),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () => onTap(0),
                        child: tabIcon(
                            name: "Home",
                            index: 0,
                            pageIndex: pageIndex,
                            icons: ImageRes.homeIcon)),
                    InkWell(
                        onTap: () => onTap(1),
                        child: tabIcon(
                            name: "Calender",
                            index: 1,
                            pageIndex: pageIndex,
                            icons: ImageRes.calenderIcon)),
                  ],
                ),
              ),
              Container(
                height: 57,
                width: 57,
                // margin: const EdgeInsets.only(
                //   bottom: 20,
                // ),
                alignment: Alignment.center,
                // decoration: const BoxDecoration(
                //   shape: BoxShape.circle,
                //   color: Colors.yellow,
                // ),
                // child: Image.asset(
                //   ImageRes.flotIcon,
                //   height: 20,
                // )
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () => onTap(2),
                        child: tabIcon(
                            name: "Leave",
                            index: 2,
                            pageIndex: pageIndex,
                            icons: ImageRes.leaveIcon)),
                    InkWell(
                        onTap: () => onTap(3),
                        child: tabIcon(
                            name: "Notification",
                            index: 3,
                            pageIndex: pageIndex,
                            icons: ImageRes.notification)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: width / 2 - 30,
        right: width / 2 - 30,
        child: InkWell(
          child: Container(
              height: 57,
              width: 57,
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: Image.asset(
                ImageRes.flotIcon,
                height: 20,
              )),
        ),
      )
    ],
  );
}

Widget tabIcon({
  required String name,
  required int index,
  required int pageIndex,
  required String icons,
}) {
  return Container(
    color: Colors.transparent,
    child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              icons,
              color: pageIndex == index ? ColorRes.blueIcon : ColorRes.greyIcon,
              fit: BoxFit.fitHeight,
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          pageIndex == index
              ? Text(name,
                  style: AppTextStyle(
                      fontFamily: "inter",
                      size: 11,
                      textColor: ColorRes.blueIcon,
                      weight: FontWeight.w600))
              : const SizedBox()
        ],
      ),
    ),
  );
}
