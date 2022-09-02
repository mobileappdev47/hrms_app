import 'package:flutter/material.dart';
import 'package:hrms_app/screen/profile_screen/profile_screen_widget/profile_screen_widget.dart';
import 'package:hrms_app/utils/color_res.dart';
import 'package:hrms_app/utils/image_res.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height*0.25,
              child: Stack(
                children: [
                  Image.asset(ImageRes.blueBox),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height*0.15,
                      width: 120,
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
                  ),


                ],
              ),
            ),
            const SizedBox(height: 20,),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               children: [
                 profileBox(image: ImageRes.payroll,text: "Payroll"),
                 profileBox(image: ImageRes.attendance,text: "Attendence"),
                 profileBox(image: ImageRes.notice,text: "Notice"),
                 profileBox(image: ImageRes.expenses,text: "Expenses"),
                 profileBox(image: ImageRes.leaveIcon,text: "Leave"),
                 profileBox(image: ImageRes.approval,text: "Approval"),
                 profileBox(image: ImageRes.visit,text: "Visit"),
                 profileBox(image: ImageRes.appointment,text: "Appointment"),
                 profileBox(image: ImageRes.breakIcon,text: "Break"),
                 profileBox(image: ImageRes.dailyLeave,text: "Daily Leave"),
               ],
             ),
           )

          ],
        ),
      ),
    );
  }
}
