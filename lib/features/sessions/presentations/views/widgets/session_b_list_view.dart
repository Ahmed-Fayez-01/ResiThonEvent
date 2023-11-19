import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';
import 'package:resithon_event/features/sessions/presentations/views/session_details_view.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_b_item.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';

class SessionsBListView extends StatefulWidget {
  const SessionsBListView({super.key, required this.instance});

  final SessionsModel instance;

  @override
  State<SessionsBListView> createState() => _SessionsBListViewState();
}

class _SessionsBListViewState extends State<SessionsBListView> {
  @override
  void initState() {
    AppConstants.foundedSessions=widget.instance.data!;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Data> result = [];
    if (enteredKeyword.isEmpty) {
      result = widget.instance.data!;
    } else {
      result = widget.instance.data!
          .where((session) => session.name!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      AppConstants.foundedSessions=result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: TextFormField(
            onChanged: (value) {
              runFilter(value);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(
                  CupertinoIcons.search,
                  size: 30,
                  color: AppColors.primarySwatchColor,
                ),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(AppConstants.sp10(context)),
                    borderSide: const BorderSide(color: Color(0xffC8C8C8))),
                hintText: 'search'.tr(),
                hintStyle: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.height * .018,
                    color: const Color(0xffC8C8C8))),
          ),
        ),
        SizedBox(height: AppConstants.height10(context),),
        AppConstants.foundedSessions.isNotEmpty? ListView.separated(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserSessionDetailsView(
                                      id: widget
                                          .instance.data![index].id!)));
                    },
                    child: SessionBWidget(
                      instance: AppConstants.foundedSessions[index],
                    )),
              ],
            )
                : GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserSessionDetailsView(
                              id: widget.instance.data![index].id!)));
                },
                child: SessionBWidget(
                  instance: widget.instance.data![index],
                ));
          },
          itemCount: AppConstants.foundedSessions.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: AppConstants.height10(context),
            );
          },
        ):SizedBox(
          height: MediaQuery.of(context).size.height*.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AssetData.noSessions,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * .8,
              ),
              SizedBox(height: AppConstants.height10(context),),
              Text(
                "No Sessions Yet",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.height * .016,
                  fontFamily: "Poppins",
                  color: const Color(0xffA5A5A5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
