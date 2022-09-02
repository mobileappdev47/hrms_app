import 'package:flutter/material.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/font_res.dart';
import 'package:hrms_app/utils/image_res.dart';
import 'dart:math' as math;

Container pmsStatusTile(
    {String? name,empNum, int? total, int? completed, int? inProgress, int? overdue,BuildContext? context}) {
  final width = MediaQuery.of(context!).size.width;

  return Container(
    height: 145,
    width:width,
    decoration: BoxDecoration(
      color: ColorRes.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // border: Border.all(
      //   color: ColorRes.grey.withOpacity(0.5),
      // ),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2.0,
            offset: const Offset(0, 0))
      ],
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 33),
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
                image: DecorationImage(image: AssetImage(ImageRes.profile))),
          ),
        ),
        Container(
          width: width * 0.39,
          margin: const EdgeInsets.only(top: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: AppTextStyle(
                    size: 18,
                    weight: FontWeight.w600,
                    textColor: const Color(0xff383838),
                    fontFamily: FontRes.inter),
              ),
              Text("Frontend Developer",
                  style: AppTextStyle(
                      size: 14,
                      weight: FontWeight.w500,
                      fontFamily: FontRes.inter,
                      textColor: ColorRes.grey2)),
              Text(empNum,
                  style: AppTextStyle(
                      size: 14,
                      weight: FontWeight.w500,
                      fontFamily: FontRes.inter,
                      textColor: ColorRes.grey2)),
            /*  Text(empNum,
                  style: AppTextStyle(
                      size: 14,
                      weight: FontWeight.w500,
                      fontFamily: FontRes.inter,
                      textColor: ColorRes.grey2)),*/
            ],
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              // decoration: BoxDecoration(border: Border.all()),
              // padding: const EdgeInsets.only(right: 70, bottom: 70),
              child: RotatedBox(
                quarterTurns: -1,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: OpenPainter(
                        total: total,
                        completed: completed,
                        inProgress: inProgress,
                        overdue: overdue,
                        range: 1,
                      ),
                      child: RotatedBox(
                          quarterTurns: -3,
                          child: Container(
                            width: 70,
                            padding: const EdgeInsets.all(8),
                            // decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
                            alignment: Alignment.center,
                            child: Text(
                                "${(completed! * 100 / total!).ceil().toString()}% \nCompleted  \n",
                                style: AppTextStyle(
                                    size: 10,
                                    fontFamily: FontRes.inter,
                                    weight: FontWeight.w700),
                                textAlign: TextAlign.center),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Text("5%"),
            // )
          ],
        ),
        Container(
          height: 145,
          width: 30,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xffD9D9D9)),
          alignment: Alignment.center,
          child: Image.asset(ImageRes.nextArrowIcon, height: 40),
        )
      ],
    ),
  );
}

class OpenPainter extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final overdue;

  // ignore: prefer_typing_uninitialized_variables
  final completed;

  // ignore: prefer_typing_uninitialized_variables
  final inProgress;

  // ignore: prefer_typing_uninitialized_variables
  final range;

  // ignore: prefer_typing_uninitialized_variables
  final total;
  double pi = math.pi;

  OpenPainter(
      {this.overdue, this.completed, this.total, this.inProgress, this.range});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5;
    Rect myRect = const Offset(40.0, -00.0) & const Size(70.0, 70.0);

    var paint1 = Paint()
      ..color = ColorRes.orange
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = ColorRes.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint3 = Paint()
      ..color = ColorRes.lightYellow
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint4 = Paint()
      ..color = ColorRes.redColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint5 = Paint()
      ..color = ColorRes.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double firstLineRadianStart = 0;
    double unAnsweredVal =
        (total - inProgress - completed - overdue) * range / total;
    double firstLineRadianEnd = (360 * unAnsweredVal) * math.pi / 180;
    canvas.drawArc(
        myRect, firstLineRadianStart, firstLineRadianEnd, false, paint1);

    double first2End = (360 * (unAnsweredVal != 0 ? 0.02 : 0)) * math.pi / 180;
    canvas.drawArc(myRect, firstLineRadianEnd, first2End, false, paint5);

    double completedVal = (completed) * range / total;
    double secondLineRadianEnd = getRadians(completedVal);
    canvas.drawArc(myRect, (first2End + firstLineRadianEnd),
        secondLineRadianEnd, false, paint2);

    double second2End = (360 * (completedVal != 0 ? 0.02 : 0)) * math.pi / 180;
    canvas.drawArc(
        myRect,
        (first2End + firstLineRadianEnd + secondLineRadianEnd),
        second2End,
        false,
        paint5);

    double inProgressVal = (inProgress) * range / total;
    double thirdLineRadianEnd = getRadians(inProgressVal);
    canvas.drawArc(
        myRect,
        firstLineRadianEnd + secondLineRadianEnd + first2End + second2End,
        thirdLineRadianEnd,
        false,
        paint3);

    double third2End = (360 * (inProgressVal != 0 ? 0.02 : 0)) * math.pi / 180;
    canvas.drawArc(
        myRect,
        (firstLineRadianEnd +
            secondLineRadianEnd +
            first2End +
            second2End +
            thirdLineRadianEnd),
        third2End,
        false,
        paint5);

    double overdueVal = (overdue) * range / total;
    double forthLineRadianEnd = getRadians(overdueVal);
    canvas.drawArc(
        myRect,
        firstLineRadianEnd +
            secondLineRadianEnd +
            first2End +
            second2End +
            thirdLineRadianEnd +
            third2End,
        forthLineRadianEnd,
        false,
        paint4);

    double forth2nd = (360 * (overdueVal != 0 ? 0.02 : 0)) * math.pi / 180;
    canvas.drawArc(
        myRect,
        firstLineRadianEnd +
            secondLineRadianEnd +
            first2End +
            second2End +
            thirdLineRadianEnd +
            third2End +
            forthLineRadianEnd,
        forth2nd,
        false,
        paint5);
    // drawArc(Rect rect, double startAngle, double sweepAngle, bool useCenter, Paint paint)
  }

  double getRadians(double value) {
    return (360 * value) * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
