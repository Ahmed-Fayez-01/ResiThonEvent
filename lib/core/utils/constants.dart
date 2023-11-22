

import 'dart:io';

import 'package:flutter/material.dart';

import '../../features/sessions/data/models/sessions_model.dart';
import '../../features/user/projects/data/models/project_model.dart';


class AppConstants {

  static File? file;
  static String selectedLang="ar";
  static String fcmToke = "";
  static int reservationEndPoint=0;
  static List<Data> foundedSessions=[];
  static List<Map<String,dynamic>> evaluationSubmit=[];
  static List<ProjectData> result = [];
  static List<ProjectData> foundedProjects=[];
  static int currentUserSessionIndex=0;
  static bool? hasConnectionResult;
  static bool? hasInternet;

  static sp10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static sp14(context){
    var height=MediaQuery.of(context).size.height*.016;
    return height;
  }
  static  sp20(context){
    var height=MediaQuery.of(context).size.height*.022;
    return height;
  }
  static  sp30(context){
    var height=MediaQuery.of(context).size.height*.032;
    return height;
  }

  static  height5(context){
    var height=MediaQuery.of(context).size.height*.006;
    return height;
  }
  static  height10(context){
    var height=MediaQuery.of(context).size.height*.012;
    return height;
  }
  static  height15(context){
    var height=MediaQuery.of(context).size.height*.018;
    return height;
  }
  static  height20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  height30(context){
    var height=MediaQuery.of(context).size.height*.030;
    return height;
  }
  static  height37(context){
    var height=MediaQuery.of(context).size.height*.049;
    return height;
  }
  static  height55(context){
    var height=MediaQuery.of(context).size.height*.075;
    return height;
  }

  static  width5(context){
    var height=MediaQuery.of(context).size.height*.0075;
    return height;
  }
  static  width10(context){
    var height=MediaQuery.of(context).size.height*.015;
    return height;
  }
  static  width15(context){
    var height=MediaQuery.of(context).size.height*.02;
    return height;
  }
  static  width20(context){
    var height=MediaQuery.of(context).size.height*.024;
    return height;
  }
  static  width30(context){
    var height=MediaQuery.of(context).size.height*.036;
    return height;
  }
  static  width147(context){
    var height=MediaQuery.of(context).size.height*.195;
    return height;
  }
}