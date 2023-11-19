class ProjectModel {
  bool? status;
  List<ProjectData>? data;
  String? message;

  ProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProjectData>[];
      json['data'].forEach((v) {
        data!.add( ProjectData.fromJson(v));
      });
    }
    message = json['message'];
  }

}

class ProjectData {
  int? id;
  String? name;
  String? image;
  int? points;
  bool? has_rate;
  String? description;
  List<Team>? team;

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    points = json['points'];
    has_rate = json['has_rate'];
    description = json['description'];
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add( Team.fromJson(v));
      });
    }
  }

}

class Team {
  int? id;
  String? name;
  String? image;

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}