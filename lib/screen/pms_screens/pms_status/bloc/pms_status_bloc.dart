import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_app/model/assign_kpi_froms_model.dart';
import 'package:hrms_app/screen/dashboard/pms_edit_screen/pms_edit_screen.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/api/get_assign_api.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_event.dart';
import 'package:hrms_app/screen/pms_screens/pms_status/bloc/pms_status_state.dart';
import 'package:hrms_app/service/navigator_service.dart';

class PMSStatusBloc extends Bloc<PMSStatusEvent, PMSStatusState> {
  PMSStatusBloc() : super(PMSStatusState()) {
    on<NavigateNextPage>(onNavigatePage);
    on<GetAssignData>(getAssignData);
  }

  FutureOr<void> onNavigatePage(
      PMSStatusEvent event, Emitter<PMSStatusState> emit) {
    NavigatorService.pushScreen(const PmsEditScreen());
  }

  FutureOr<void> getAssignData(
      GetAssignData event, Emitter<PMSStatusState> emit) async {
    AssignedKpiFormsModel assignedKpiFormsModel;
    emit(state.copyWith(
        loading: true, assignedKpiFormsModel: AssignedKpiFormsModel()));
    assignedKpiFormsModel = await GetAssignApi.getAssignData();

    emit(state.copyWith(
        assignedKpiFormsModel: assignedKpiFormsModel, loading: false));
  }
}
