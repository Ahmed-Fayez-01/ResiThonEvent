class SessionEvaluationResponseModel {
  bool? status;
  String? data;
  String? message;

  SessionEvaluationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

}