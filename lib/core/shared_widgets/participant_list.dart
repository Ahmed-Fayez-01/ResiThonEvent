import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/participant_item.dart';
import 'package:resithon_event/features/sessions/data/models/specific_session_model.dart';
import '../utils/constants.dart';

class ParticipantList extends StatelessWidget {
  const ParticipantList({super.key, required this.participants});

  final List<Participants>? participants;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Row(
          children: [
            SizedBox(
              width: AppConstants.width20(context),
            ),
            ParticipantItem(
              participantName: participants![index].name!,
              imagePath: participants![index].image!,),
          ],
        ) : ParticipantItem(
          participantName: participants![index].name!,
          imagePath: participants![index].image!,);

      },
      itemCount: participants!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: AppConstants.width10(context),
        );
      },
    );
  }
}
