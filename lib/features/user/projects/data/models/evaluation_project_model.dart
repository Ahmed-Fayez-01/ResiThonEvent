class EvaluationProjectModel {
  bool? status;
  List<Data>? data;
  String? message;


  EvaluationProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class Data {
  int? id;
  String? name;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}