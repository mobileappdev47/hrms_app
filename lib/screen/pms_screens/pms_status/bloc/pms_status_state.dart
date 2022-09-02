import 'package:hrms_app/model/assign_kpi_froms_model.dart';

class PMSStatusState {
  bool isLoading;
  List title = [
    "George",
    "Augustin Raj",
    "Srini",
    "Kanchana",
  ];
  List total = [100, 40, 50, 30];
  List completed = [0, 10, 9, 4];
  List inProgress = [0, 0, 0, 5];
  List overdue = [0, 10, 20, 10];
  AssignedKpiFormsModel? assignedKpiFormsModel;

  PMSStatusState({this.assignedKpiFormsModel, this.isLoading = true}){
    assignedKpiFormsModel ??= AssignedKpiFormsModel();
  }

  PMSStatusState copyWith(
  {AssignedKpiFormsModel? assignedKpiFormsModel, bool? loading}) {
    return PMSStatusState(
        assignedKpiFormsModel: assignedKpiFormsModel, isLoading: loading!);
  }
}
