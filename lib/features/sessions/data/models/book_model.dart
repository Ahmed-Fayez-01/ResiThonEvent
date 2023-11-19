class BookModel {
  bool? status;
  String? data;
  String? message;

  BookModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

}