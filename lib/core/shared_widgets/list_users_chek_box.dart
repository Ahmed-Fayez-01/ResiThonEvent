import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';

class ListOfUsersCheckBox extends StatefulWidget {
  const ListOfUsersCheckBox({super.key,required this.itemCount});

  final int itemCount;

  @override
  State<ListOfUsersCheckBox> createState() => _UserCheckBoxState();
}

class _UserCheckBoxState extends State<ListOfUsersCheckBox> {
  var selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
              gradient: selectedIndexes.contains(index)
                  ? const LinearGradient(
                // begin: Alignment.centerRight,
                  stops: [0.1, .8],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                  colors: [
                    Color(0x1af15f42),
                    Color(0x00f15f42),
                  ])
                  : null),
          child: Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  secondary: CircleAvatar(
                    radius: MediaQuery.of(context).size.height*.03,
                    backgroundImage: const AssetImage("assets/images/man.jpg"),
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Participant Name"),
                  value: selectedIndexes.contains(index),
                  onChanged: (value) {
                    setState(() {
                      if (selectedIndexes.contains(index)) {
                        selectedIndexes.remove(index); // unselect
                      } else {
                        selectedIndexes.add(index); // select
                      }
                    });
                  },
                  activeColor: AppColors.primarySwatchColor,
                  side: BorderSide(
                    // ======> CHANGE THE BORDER COLOR HERE <======
                    color: selectedIndexes.contains(index)
                        ? AppColors.primarySwatchColor
                        : Colors.white,
                    // Give your checkbox border a custom width
                    width: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: widget.itemCount,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: AppConstants.height10(context),
        );
      },
    );
  }
}
