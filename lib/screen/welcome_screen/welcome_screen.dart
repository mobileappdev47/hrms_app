import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_bloc.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_event.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_state.dart';
import 'package:hrms_app/utils/app_style.dart';
import 'package:hrms_app/utils/color_res.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    context.read<WelcomeBloc>().add(OnStart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) => Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: height * 0.55,
              child: PageView(

                controller: state.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) =>
                    context.read<WelcomeBloc>().add(SliderChange(index: index)),
                children: state.sliderList,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HRMS",
                    style: AppTextStyle(
                        size: 26,
                        fontFamily: "rubik",
                        weight: FontWeight.w700,
                        textColor: ColorRes.blackText),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt u t labore et dolore magna aliqua",
                    textAlign: TextAlign.center,
                    style: AppTextStyle(
                      size: 14,
                      textColor: ColorRes.greyText,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: state.buildPageIndicator(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () =>context.read<WelcomeBloc>().add(NavigatePage()),
                child: Container(
                  height: 45,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFE0D8D8).withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      "Skip",
                      style: AppTextStyle(
                          fontFamily: "inter",
                          textColor: ColorRes.grey,
                          weight: FontWeight.w600,
                          size: 12),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.read<WelcomeBloc>().add(NextPage()),
                child: Container(
                  height: 45,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorRes.orange,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
