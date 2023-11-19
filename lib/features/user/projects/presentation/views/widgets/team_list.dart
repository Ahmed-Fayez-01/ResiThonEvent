import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/shared_widgets/participant_item.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../data/models/project_model.dart';

class TeamList extends StatelessWidget {
  const TeamList({super.key,required this.instance});
  final List<Team> instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text(
            "team".tr(),
            style:  TextStyle(
                fontSize: MediaQuery.of(context).size.height*.018,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: const Color(0xCC323232)),
          ),
        ),
        SizedBox(height: AppConstants.height20(context),),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){
            return  ParticipantItem(participantName: instance[index].name!, imagePath: instance[index].image!,);
          },itemCount: instance.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),),
      ],
    );
  }
}
