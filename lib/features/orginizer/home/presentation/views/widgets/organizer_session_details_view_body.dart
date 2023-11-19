// import 'package:flutter/material.dart';
// import 'package:resithon/core/shared_widgets/description_point.dart';
// import 'package:resithon/core/shared_widgets/main_title_component.dart';
// import 'package:resithon/core/shared_widgets/user_image_and_name.dart';
// import 'package:resithon/core/utils/assets/assets.dart';
// import 'package:resithon/core/utils/constants.dart';
// import 'package:resithon/core/shared_widgets/participant_list.dart';
// import 'package:resithon/core/shared_widgets/participant_title.dart';
// import 'package:resithon/core/shared_widgets/session_header.dart';
// import '../../../../../../core/shared_widgets/custom_button.dart';
// import '../../../../../../core/shared_widgets/more_details_widget.dart';
//
// class OrganizerSessionDetailsViewBody extends StatelessWidget {
//   const OrganizerSessionDetailsViewBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SessionHeader(),
//         SizedBox(
//           height: AppConstants.height20(context),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
//           child: Column(
//             children: [
//               const MainTitleComponent(title: "Update CV"),
//               SizedBox(
//                 height: AppConstants.height20(context),
//               ),
//               const UserImageAndName(
//                   image: 'assets/images/man.jpg', name: "Speaker Name"),
//               SizedBox(
//                 height: AppConstants.height20(context),
//               ),
//               const DescriptionPoint(
//                   iconPath: AssetData.location,
//                   description: "1st hall, 2nd floor, Zahraa hotel"),
//               SizedBox(
//                 height: AppConstants.height10(context),
//               ),
//               const DescriptionPoint(
//                   iconPath: AssetData.timer,
//                   description: "03:00 AM - 05:00 AM"),
//               SizedBox(
//                 height: AppConstants.height20(context),
//               ),
//               const MoreDetailsWidget(title: 'More Details', description:"Ut enim ad minima veniam, quis nostrum ationem ullam corporis suscipit laboriosam, nisi ut al Sed ut perspiciatis unde omnis iste natus error sit ptatem accusantium doloremque laudantium.",),
//               SizedBox(
//                 height: AppConstants.height20(context),
//               ),
//               const ParticipantTitle(),
//               SizedBox(
//                 height: AppConstants.height20(context),
//               ),
//             ],
//           ),
//         ),
//         const Expanded(
//           child: ParticipantList(),
//         ),
//         DefaultButton(
//           onPress: () {},
//           text: "15 : 12",
//           backgroundColor: const Color(0xffA5A5A5),
//         ),
//       ],
//     );
//   }
// }
