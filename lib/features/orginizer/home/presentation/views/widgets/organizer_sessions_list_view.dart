// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:resithon/core/utils/constants.dart';
// import 'package:resithon/core/shared_widgets/session_item.dart';
//
// class OrganizerSessionsListView extends StatelessWidget {
//   const OrganizerSessionsListView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (BuildContext context,int index){
//       return index==0 ? Column(
//         children: [
//           SizedBox(height: AppConstants.height10(context),),
//           GestureDetector(onTap: (){
//         GoRouter.of(context).push("/organizerSessionDetailsView");
//         },child: SessionItem()),
//         ],
//       ):GestureDetector(onTap: (){
//         GoRouter.of(context).push("/organizerSessionDetailsView");
//       },child: SessionItem());
//     },itemCount: 3, separatorBuilder: (BuildContext context, int index) {
//       return SizedBox(height: AppConstants.height10(context),);
//     },);
//   }
// }
