import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/dashboard/dashboard_screen.dart';
import 'package:hrms_app/screen/login_screen/api/login_api.dart';
import 'package:hrms_app/screen/login_screen/bloc/login_bloc_event.dart';
import 'package:hrms_app/screen/login_screen/bloc/login_bloc_state.dart';
import 'package:hrms_app/service/navigator_service.dart';
import 'package:hrms_app/utils/pref_key_utils.dart';
import 'package:hrms_app/service/shared_prefrence_service.dart';
import 'package:hrms_app/utils/toast_msg.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<ChangePasswordVisibility>(onPasswordVisible);
    on<DashBoardNavigator>(dashBoardNavigator);
    on<GetData>(callApi);
  }

  FutureOr<void> onPasswordVisible(
      ChangePasswordVisibility event, Emitter<LoginState> emit) {
    emit(state.copyWith(visible: !state.isShow!));
  }

  FutureOr<void> dashBoardNavigator(
      DashBoardNavigator event, Emitter<LoginState> emit) {
    NavigatorService.pushScreen(const DashBoardScreen());
  }

  FutureOr<void> callApi(GetData event, Emitter<LoginState> emit) async {
    if (state.userNameController!.text.isEmpty) {
      showToast("UserName Should not be Null");
    } else if (state.passwordController!.text.isEmpty) {
      showToast("Password Should not be Null");
    } else {
      emit(state.copyWith(loading: true));
      dynamic response = await LoginApi.getLogin(
          state.userNameController!.text, state.passwordController!.text);
      emit(state.copyWith(loading: false));
      if (response['status'] == true) {
        StoragePrefService()
            .setPrefString(key: StorageRes.token, value: response['token']);

        showToast("Login SuccessFully");
        NavigatorService.pushScreen(const DashBoardScreen());
      } else {
        showToast(response['message']);
      }
    }
  }
}
