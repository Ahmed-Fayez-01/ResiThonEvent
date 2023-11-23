import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/session_item.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';
import 'package:resithon_event/features/sessions/presentations/views/session_details_view.dart';

import '../../../../../../core/utils/assets/assets.dart';


class OrganizerSessionsListView extends StatelessWidget {
  OrganizerSessionsListView({super.key, required this.instance});

  final SessionsModel instance;
  List<Data> sessions=[];

  @override
  Widget build(BuildContext context) {
    sessions.clear();
    instance.data!.forEach((element) {
      if (element.is_session == true) {
        sessions.add(element);
      }
    });
    return sessions.isNotEmpty? ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
          return index == 0
              ? Column(
            children: [
              SizedBox(
                height: AppConstants.height10(context),
              ),
              GestureDetector(
                  onTap: () {
                    AppConstants.evaluationSubmit.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserSessionDetailsView(
                                id: sessions[index].id!)));
                  },
                  child: SessionItem(
                    instance: sessions[index],
                  )),
            ],
          )
              : GestureDetector(
              onTap: () {
                AppConstants.evaluationSubmit.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserSessionDetailsView(
                            id: sessions[index].id!)));
              },
              child: SessionItem(
                instance: sessions[index],
              ));

      },
      itemCount: sessions.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: AppConstants.height10(context),
        );
      },
    ): SizedBox(
      height: MediaQuery.of(context).size.height*.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetData.noSessions,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .5,
          ),
        ],
      ),
    );
  }
}
