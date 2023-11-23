import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/session_item.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';
import 'package:resithon_event/features/sessions/presentations/views/session_details_view.dart';

import '../../../../../core/utils/assets/assets.dart';

class SessionsListView extends StatelessWidget {
  const SessionsListView({super.key, required this.instance});

  final SessionsModel instance;

  @override
  Widget build(BuildContext context) {
    return instance.data!.isNotEmpty? ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if(instance.data![index].is_session!)
          {
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
                                  id: instance.data![index].id!)));
                    },
                    child: SessionItem(
                      instance: instance.data![index],
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
                              id: instance.data![index].id!)));
                },
                child: SessionItem(
                  instance: instance.data![index],
                ));
          }else{
          return const SizedBox();
        }

      },
      itemCount: instance.data!.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: AppConstants.height10(context),
        );
      },
    ): SizedBox(
      height: MediaQuery.of(context).size.height*.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetData.noSessions,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .4,
          ),
        ],
      ),
    );
  }
}
