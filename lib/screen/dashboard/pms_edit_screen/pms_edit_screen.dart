import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_bloc.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_event.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_state.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/pms_edit_screen_widget/pms_edit_screen_widget.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/image_res.dart';

class PmsEditScreen extends StatelessWidget {
  const PmsEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    ImageRes.blueBox,
                  ),
                )),
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<PMSEditBloc>().add(OnCallBack());
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "PMS",
                        style: AppTextStyle(
                            fontFamily: "inter",
                            weight: FontWeight.w600,
                            textColor: Colors.white,
                            size: 18),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<PMSEditBloc, PMSEditState>(
                      builder: (context, state) => state.isShow == false
                          ? InkWell(
                              onTap: () =>
                                  context.read<PMSEditBloc>().add(IsShow()),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 2.0,
                                          spreadRadius: 2.0),
                                    ],
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorRes.lightGreenColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dimensions",
                                      style: AppTextStyle(
                                          fontFamily: "inter",
                                          textColor: ColorRes.blackColor),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: ColorRes.grey,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 2.0,
                                        spreadRadius: 2.0),
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorRes.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => context
                                        .read<PMSEditBloc>()
                                        .add(IsShow()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Dimensions",
                                          style: AppTextStyle(
                                              fontFamily: "inter",
                                              textColor: ColorRes.blackColor),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: ColorRes.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1,
                                    color: ColorRes.grey,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: generateChildren(
                                        text: state.text,
                                        selectedText: state.selected,
                                        onTap: (String text) => context
                                            .read<PMSEditBloc>()
                                            .add(AddRemoveText(text: text))),
                                  )
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: height * 0.2,
                      width: width,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: ColorRes.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KPI",
                            style: AppTextStyle(
                                fontFamily: "inter",
                                textColor: ColorRes.green,
                                size: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetuer",
                            style: AppTextStyle(
                                fontFamily: "inter",
                                textColor: const Color(0xFF484848),
                                size: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: height * 0.2,
                      width: width,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 2.0,
                                spreadRadius: 2.0),
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: ColorRes.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Self Review",
                            style: AppTextStyle(
                                fontFamily: "inter",
                                textColor: const Color(0xFFCDCAC8),
                                size: 17),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: ColorRes.grey.withOpacity(0.2)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ColorRes.grey.withOpacity(0.2)),
                                color: ColorRes.grey.withOpacity(0.2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Target",
                                  style: AppTextStyle(
                                      textColor: ColorRes.red,
                                      fontFamily: "inter",
                                      size: 17),
                                ),
                                Text(
                                  "Achivement",
                                  style: AppTextStyle(
                                      textColor: ColorRes.green,
                                      fontFamily: "inter",
                                      size: 17),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              children: [
                                Text(
                                  "90%",
                                  style: AppTextStyle(
                                      textColor: ColorRes.blackColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: ColorRes.grey.withOpacity(0.2)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: ColorRes.grey.withOpacity(0.2)),
                                color: ColorRes.grey.withOpacity(0.2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Target",
                                  style: AppTextStyle(
                                      textColor: ColorRes.red,
                                      fontFamily: "inter",
                                      size: 17),
                                ),
                                Text(
                                  "Achivement",
                                  style: AppTextStyle(
                                      textColor: ColorRes.green, size: 17),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              children: [
                                Text(
                                  "90%",
                                  style: AppTextStyle(
                                      textColor: ColorRes.blackColor),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.44,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorRes.orangeLight),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Save",
                          style: AppTextStyle(
                              fontFamily: "inter",
                              textColor: ColorRes.orangeLight,
                              size: 14),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.44,
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorRes.orangeLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: AppTextStyle(
                              fontFamily: "inter",
                              textColor: ColorRes.white,
                              size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
