class EvaluationResponseModel {
  bool? status;
  String? data;
  String? message;

  EvaluationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

}