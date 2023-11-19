import 'package:flutter/material.dart';

Future buildBottomSheet(BuildContext context, Widget widget) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30) ),
      ),
      builder: (BuildContext bc) {
        return  Container(height: MediaQuery.of(context).size.height * 0.60,
            padding: const EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0),
            child: widget);
      });
}
