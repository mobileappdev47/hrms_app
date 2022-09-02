import 'dart:io';

import 'package:hrms_app/model/assign_kpi_froms_model.dart';
import 'package:hrms_app/service/http_service.dart';
import 'package:hrms_app/service/shared_prefrence_service.dart';
import 'package:hrms_app/utils/pref_key_utils.dart';
import 'package:hrms_app/utils/toast_msg.dart';
import 'package:http/http.dart' as http;

class GetAssignApi {
  static Future<AssignedKpiFormsModel> getAssignData() async {
    String token =
        await StoragePrefService().getPrefStringValue(StorageRes.token);
    try {
      String url =
          "https://precede.abshrms.com/api/getAssigneeKPIForms?assignee_id=337";
      http.Response? response = await HttpService.postApi(
          url: url, header: {"Authorization": "Bearer $token"});
      return assignedKpiFormsModelFromJson(response!.body);
    } catch (e) {
      showToast(e.toString());
      return AssignedKpiFormsModel();
    }
  }
}
