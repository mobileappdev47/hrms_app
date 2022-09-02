// To parse this JSON data, do
//
//     final assignedKpiFormsModel = assignedKpiFormsModelFromJson(jsonString);

import 'dart:convert';

AssignedKpiFormsModel assignedKpiFormsModelFromJson(String str) => AssignedKpiFormsModel.fromJson(json.decode(str));

String assignedKpiFormsModelToJson(AssignedKpiFormsModel data) => json.encode(data.toJson());

class AssignedKpiFormsModel {
  AssignedKpiFormsModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory AssignedKpiFormsModel.fromJson(Map<String, dynamic> json) => AssignedKpiFormsModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.vmtPmsKpiformId,
    this.assigneeId,
    this.reviewer,
    this.assignerId,
    this.calendarType,
    this.year,
    this.frequency,
    this.assignmentPeriod,
    this.departmentId,
    this.assignedKpiFormReviewDetails,
  });

  int? id;
  String? vmtPmsKpiformId;
  String? assigneeId;
  List<Reviewer>? reviewer;
  String? assignerId;
  String? calendarType;
  String? year;
  String? frequency;
  String? assignmentPeriod;
  String? departmentId;
  AssignedKpiFormReviewDetails? assignedKpiFormReviewDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    vmtPmsKpiformId: json["vmt_pms_kpiform_id"],
    assigneeId: json["assignee_id"],
    reviewer: List<Reviewer>.from(json["reviewer"].map((x) => Reviewer.fromJson(x))),
    assignerId: json["assigner_id"],
    calendarType: json["calendar_type"],
    year: json["year"],
    frequency: json["frequency"],
    assignmentPeriod: json["assignment_period"],
    departmentId: json["department_id"],
    assignedKpiFormReviewDetails: AssignedKpiFormReviewDetails.fromJson(json["assigned_kpi_form_review_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vmt_pms_kpiform_id": vmtPmsKpiformId,
    "assignee_id": assigneeId,
    "reviewer": List<dynamic>.from(reviewer!.map((x) => x.toJson())),
    "assigner_id": assignerId,
    "calendar_type": calendarType,
    "year": year,
    "frequency": frequency,
    "assignment_period": assignmentPeriod,
    "department_id": departmentId,
    "assigned_kpi_form_review_details": assignedKpiFormReviewDetails!.toJson(),
  };
}

class AssignedKpiFormReviewDetails {
  AssignedKpiFormReviewDetails({
    this.id,
    this.vmtPmsKpiformAssignedId,
    this.assigneeId,
    this.assigneeName,
    this.assigneeEmpNo,
    this.reviewerRating,
    this.assigneeKpiReview,
    this.assigneeKpiPercentage,
    this.assigneeKpiComments,
    this.reviewerKpiReview,
    this.reviewerKpiPercentage,
    this.reviewerKpiComments,
    this.reviewerAppraisalComments,
    this.assignerKpiReview,
    this.assignerKpiPercentage,
    this.assignerKpiComments,
    this.assigneeKpiStatus,
    this.isAssigneeSubmitted,
    this.isAssigneeAccepted,
    this.reviewerKpiStatus,
    this.isReviewerSubmitted,
    this.isReviewerAccepted,
    this.assigneeRejectionComments,
    this.reviewerRejectionComments,
    this.overallScore,
  });

  int? id;
  String? vmtPmsKpiformAssignedId;
  String? assigneeId;
  String? assigneeName;
  String? assigneeEmpNo;
  int? reviewerRating;
  String? assigneeKpiReview;
  String? assigneeKpiPercentage;
  String? assigneeKpiComments;
  String? reviewerKpiReview;
  String? reviewerKpiPercentage;
  String? reviewerKpiComments;
  String? reviewerAppraisalComments;
  String? assignerKpiReview;
  String? assignerKpiPercentage;
  String? assignerKpiComments;
  String? assigneeKpiStatus;
  String? isAssigneeSubmitted;
  String? isAssigneeAccepted;
  String? reviewerKpiStatus;
  IsReviewerSubmitted? isReviewerSubmitted;
  String? isReviewerAccepted;
  String? assigneeRejectionComments;
  String? reviewerRejectionComments;
  String? overallScore;

  factory AssignedKpiFormReviewDetails.fromJson(Map<String, dynamic> json) => AssignedKpiFormReviewDetails(
    id: json["id"],
    vmtPmsKpiformAssignedId: json["vmt_pms_kpiform_assigned_id"],
    assigneeId: json["assignee_id"],
    assigneeName: json["assignee_name"],
    assigneeEmpNo: json["assignee_emp_no"],
    reviewerRating: json["reviewer_rating"],
    assigneeKpiReview: json["assignee_kpi_review"],
    assigneeKpiPercentage: json["assignee_kpi_percentage"],
    assigneeKpiComments: json["assignee_kpi_comments"],
    reviewerKpiReview: json["reviewer_kpi_review"],
    reviewerKpiPercentage: json["reviewer_kpi_percentage"],
    reviewerKpiComments: json["reviewer_kpi_comments"],
    reviewerAppraisalComments: json["reviewer_appraisal_comments"],
    assignerKpiReview: json["assigner_kpi_review"],
    assignerKpiPercentage: json["assigner_kpi_percentage"],
    assignerKpiComments: json["assigner_kpi_comments"],
    assigneeKpiStatus: json["assignee_kpi_status"],
    isAssigneeSubmitted: json["is_assignee_submitted"],
    isAssigneeAccepted: json["is_assignee_accepted"],
    reviewerKpiStatus: json["reviewer_kpi_status"],
    isReviewerSubmitted: IsReviewerSubmitted.fromJson(json["is_reviewer_submitted"]),
    isReviewerAccepted: json["is_reviewer_accepted"],
    assigneeRejectionComments: json["assignee_rejection_comments"],
    reviewerRejectionComments: json["reviewer_rejection_comments"],
    overallScore: json["overall_score"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vmt_pms_kpiform_assigned_id": vmtPmsKpiformAssignedId,
    "assignee_id": assigneeId,
    "assignee_name": assigneeName,
    "assignee_emp_no": assigneeEmpNo,
    "reviewer_rating": reviewerRating,
    "assignee_kpi_review": assigneeKpiReview,
    "assignee_kpi_percentage": assigneeKpiPercentage,
    "assignee_kpi_comments": assigneeKpiComments,
    "reviewer_kpi_review": reviewerKpiReview,
    "reviewer_kpi_percentage": reviewerKpiPercentage,
    "reviewer_kpi_comments": reviewerKpiComments,
    "reviewer_appraisal_comments": reviewerAppraisalComments,
    "assigner_kpi_review": assignerKpiReview,
    "assigner_kpi_percentage": assignerKpiPercentage,
    "assigner_kpi_comments": assignerKpiComments,
    "assignee_kpi_status": assigneeKpiStatus,
    "is_assignee_submitted": isAssigneeSubmitted,
    "is_assignee_accepted": isAssigneeAccepted,
    "reviewer_kpi_status": reviewerKpiStatus,
    "is_reviewer_submitted": isReviewerSubmitted!.toJson(),
    "is_reviewer_accepted": isReviewerAccepted,
    "assignee_rejection_comments": assigneeRejectionComments,
    "reviewer_rejection_comments": reviewerRejectionComments,
    "overall_score": overallScore,
  };
}

class IsReviewerSubmitted {
  IsReviewerSubmitted({
    this.the388,
  });

  String? the388;

  factory IsReviewerSubmitted.fromJson(Map<String, dynamic> json) => IsReviewerSubmitted(
    the388: json["388"],
  );

  Map<String, dynamic> toJson() => {
    "388": the388,
  };
}

class Reviewer {
  Reviewer({
    this.reviewerId,
    this.reviewerName,
  });

  String? reviewerId;
  String? reviewerName;

  factory Reviewer.fromJson(Map<String, dynamic> json) => Reviewer(
    reviewerId: json["reviewer_id"],
    reviewerName: json["reviewer_name"],
  );

  Map<String, dynamic> toJson() => {
    "reviewer_id": reviewerId,
    "reviewer_name": reviewerName,
  };
}
