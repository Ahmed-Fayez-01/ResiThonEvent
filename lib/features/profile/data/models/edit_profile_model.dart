
class EditProfileModel {
  bool? status;
  Data? data;
  String? message;

  EditProfileModel({this.status, this.data, this.message});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class Data {
  int? id;
  String? name;
  String? image;
  String? role;
  String? iCan;

  Data({this.id, this.name, this.image, this.role, this.iCan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    role = json['role'];
    iCan = json['i_can'];
  }

}