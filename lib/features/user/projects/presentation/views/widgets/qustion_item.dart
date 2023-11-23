import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/custom_text_form_filed.dart';

import '../../../../../../core/utils/constants.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({super.key, required this.index, required this.question, required this.id, required this.projectId});

  final int index;
  final int id;
  final int projectId;
  final String question;

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  List<bool> selected = [false, false, false, false, false];
  bool added=false;
  List<TextEditingController> comments = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${widget.index + 1} ) ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.height * .016,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              width: AppConstants.width5(context),
            ),
            Expanded(
              child: Text(
                widget.question,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.height * .016,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i <= 4; i++) {
                    if (i == index) {
                      selected[i] = true;
                    } else {
                      selected[i] = false;
                    }
                  }
                });
                if(AppConstants.evaluationSubmit.isNotEmpty)
                  {
                    for (Map m in AppConstants.evaluationSubmit) {
                      if(m['question_id']==widget.id)
                      {
                        AppConstants.evaluationSubmit.remove(m);
                        AppConstants.evaluationSubmit.add({
                          "question_id":widget.id,
                          "project_id": widget.projectId,
                          "rate": index + 1,
                          "comment": comments[widget.index].text,
                        });
                        added=true;
                      }
                    }
                    if(!added)
                    {
                      AppConstants.evaluationSubmit.add({
                        "question_id":widget.id,
                        "project_id": widget.projectId,
                        "rate": index + 1,
                        "comment": comments[widget.index].text,
                      });
                      added=false;
                    }
                  }else{
                  AppConstants.evaluationSubmit.add({
                    "question_id":widget.id,
                    "project_id": widget.projectId,
                    "rate": index + 1,
                    "comment": comments[widget.index].text,
                  });
                }
                print("dfd : ${AppConstants.evaluationSubmit}");
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.height * .05,
                decoration: BoxDecoration(
                    color: selected[index] && (index + 1) < 3
                        ? Colors.red
                        : selected[index] && (index + 1) == 3
                            ? const Color(0xffEDC907)
                            : selected[index] && (index + 1) >= 4
                                ? Colors.green
                                : null,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * .05),
                    border: Border.all(color: const Color(0xffA5A5A5))),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * .05),
                    child: Center(
                        child: Text(
                      "${index + 1}",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: MediaQuery.of(context).size.height * .020,
                          fontWeight: FontWeight.w600,
                          color: selected[index]
                              ? Colors.white
                              : const Color(0xffA5A5A5)),
                    ))),
              ),
            );
          },
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: AppConstants.width20(context),
            mainAxisSpacing: AppConstants.height10(context),
          ),
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        Text(
          "ADD Comment",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height * .016,
              fontFamily: "Poppins",
              color: const Color(0xffA5A5A5)),
        ),
        SizedBox(
          height: AppConstants.height5(context),
        ),
        CustomTextFormField(
          maxLines: 3,
          onChange: (value){
            if(AppConstants.evaluationSubmit.isNotEmpty)
            {
                for (var item in AppConstants.evaluationSubmit) {
                  if (widget.id == item['question_id']) {
                    item['comment'] = value;
                  }
                }

            }
            print("dfd : ${AppConstants.evaluationSubmit}");
          },
          controller: comments[widget.index],
        ),
        SizedBox(
          height: AppConstants.height10(context),
        ),
        const Divider(),
      ],
    );
  }
}
