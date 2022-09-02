import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc_event.dart';
import 'package:hrms_app/screen/dashboard/bloc/dashboard_bloc_state.dart';
import 'package:hrms_app/service/shared_prefrence_service.dart';
import 'package:hrms_app/utils/pref_key_utils.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashBoardState> {
  DashboardBloc() : super(DashBoardState()) {
    on<ChangeTab>(onDashBoardChange);
    on<OnInit>(init);
  }

  FutureOr<void> onDashBoardChange(
      ChangeTab event, Emitter<DashBoardState> emit) {
    emit(state.copyWith(
      currentTab: event.index,
    ));
  }

  FutureOr<void> init(OnInit event, Emitter<DashBoardState> emit) async {
    emit(state.copyWith(
        token:
            await StoragePrefService().getPrefStringValue(StorageRes.token)));
  }
}
