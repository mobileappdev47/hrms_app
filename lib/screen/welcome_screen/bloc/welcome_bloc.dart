import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/login_screen/login_screen.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_event.dart';
import 'package:hrms_app/screen/welcome_screen/bloc/welcome_state.dart';
import 'package:hrms_app/service/navigator_service.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<SliderChange>(onSliderChange);
    on<NextPage>(onNextPageSlider);
    on<NavigatePage>(onNavigatorPage);
    on<OnStart>(onStart);
  }

  FutureOr<void> onSliderChange(
      SliderChange event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(index: event.index));
  }

  FutureOr<void> onNextPageSlider(NextPage event, Emitter<WelcomeState> emit) {
    if (state.selectedIndex < 2) {
      state.pageController!.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      emit(state.copyWith(index: state.selectedIndex + 1));
    } else {
      NavigatorService.pushScreen(const LoginScreen());
    }
  }

  FutureOr<void> onNavigatorPage(
      NavigatePage event, Emitter<WelcomeState> emit) {
    NavigatorService.pushScreen(const LoginScreen());
  }

  FutureOr<void> onStart(OnStart event, Emitter<WelcomeState> emit) {
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(index: 0, controller: PageController()));
    });
  }
}
