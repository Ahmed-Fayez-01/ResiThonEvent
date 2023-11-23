import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/shared_widgets/session_item.dart';
import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../sessions/data/models/sessions_model.dart';
import '../../../../../sessions/presentations/views/session_details_view.dart';

class FoodListView extends StatelessWidget {
  FoodListView({super.key, required this.instance});

  final SessionsModel instance;
  List<Data> food = [];

  @override
  Widget build(BuildContext context) {
    food.clear();
    instance.data!.forEach((element) {
      if (element.is_session == false) {
        food.add(element);
      }
    });
    return food.isNotEmpty
        ? ListView.separated(
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
                                      builder: (context) =>
                                          UserSessionDetailsView(
                                              id: food[index].id!)));
                            },
                            child: SessionItem(
                              instance: food[index],
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
                                    id: food[index].id!)));
                      },
                      child: SessionItem(
                        instance: food[index],
                      ));
            },
            itemCount: food.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: AppConstants.height10(context),
              );
            },
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * .3,
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
