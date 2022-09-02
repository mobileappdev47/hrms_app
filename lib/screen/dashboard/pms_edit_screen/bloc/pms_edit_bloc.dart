import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_event.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/bloc/pms_edit_state.dart';
import 'package:hrms_app/service/navigator_service.dart';

class PMSEditBloc extends Bloc<PMSEditEvent, PMSEditState> {
  PMSEditBloc() : super(PMSEditState()) {
    on<IsShow>(onChangeShow);
    on<AddRemoveText>(addRemoveText);
    on<OnCallBack>(onCallBack);
  }

  FutureOr<void> onChangeShow(IsShow event, Emitter<PMSEditState> emit) {
    emit(state.copyWith(show: !state.isShow));
  }

  FutureOr<void> addRemoveText(
      AddRemoveText event, Emitter<PMSEditState> emit) {
    List list = [];
    if (state.selected!.contains(event.text)) {
      state.selected!.remove(event.text);
      list = state.selected!;
      emit(state.copyWith(list: list));
    } else {
      state.selected!.add(event.text);
      list = state.selected!;
      emit(state.copyWith(list: list));
    }
  }

  FutureOr<void> onCallBack(OnCallBack event, Emitter<PMSEditState> emit) {
    NavigatorService.pop();
  }
}
