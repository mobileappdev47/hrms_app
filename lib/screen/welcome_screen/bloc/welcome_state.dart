import 'package:flutter/material.dart';
import 'package:hrms_app/screen/welcome_screen/widget/welcome_screen_widget.dart';
import 'package:hrms_app/utils/image_res.dart';

class WelcomeState {
  PageController? pageController;

  int selectedIndex;
  List<Widget> sliderList = [
    SliderPage(
      image: ImageRes.sliderPage1,
      content: "Lorem",
    ),
    SliderPage(
      image: ImageRes.sliderPage2,
      content: "Lorem",
    ),
    SliderPage(
      image: ImageRes.sliderPage3,
      content: "Lorem",
    ),
  ];

  buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == selectedIndex ? indicator(true) : indicator(false));
    }
    return list;
  }

  WelcomeState({this.selectedIndex = 0, this.pageController}) {
    pageController ??= PageController(initialPage: 0);
  }

  WelcomeState copyWith({int? index, PageController? controller}) {
    return WelcomeState(
        selectedIndex: index ?? selectedIndex, pageController: controller);
  }
}
