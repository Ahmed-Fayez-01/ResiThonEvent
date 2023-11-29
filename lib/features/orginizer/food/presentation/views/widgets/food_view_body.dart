import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/shared_widgets/custom_back_button.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/orginizer/food/presentation/views/widgets/ticket_info.dart';

import 'foot_item.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.sp20(context)),
            child: Column(
              children: [
                CustomBackButton(),
                SizedBox(height: AppConstants.height20(context),),
                const MainTitleComponent(title: "Food"),
                SizedBox(height: AppConstants.height20(context),),
                Row(
                  children: [
                    const Expanded(
                      child: SizedBox()
                    ),
                    Expanded(child: SvgPicture.asset(AssetData.foodCruser)),
                    const Expanded(
                      child: SizedBox()
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.height15(context),),
                Row(
                  children: [
                    const Expanded(
                      child: FoodItem(title: 'VIP Ticket', imagePath: AssetData.vipFood,),
                    ),
                    SizedBox(width: AppConstants.width20(context),),
                    const Expanded(
                      child: FoodItem(title: 'Normal Ticket', imagePath: AssetData.normalFood,),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.1,),
                const TicketInfo(imagePath: "assets/images/man.jpg", name: "Participant Name", ticketType: "VIP Ticket"),
              ],
            ),
          ),
        ),
        DefaultButton(onPress: (){}, text: "Scan",icon: SvgPicture.asset(AssetData.scan),)
      ],
    );
  }
}
