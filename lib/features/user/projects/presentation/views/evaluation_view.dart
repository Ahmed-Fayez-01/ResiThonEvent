import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/user/projects/data/models/project_model.dart';
import 'package:resithon_event/features/user/projects/presentation/views/projects_details_view.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/evaluation_view_body.dart';

import '../../../../../core/utils/colors/colors.dart';

class EvaluationView extends StatelessWidget {
  const EvaluationView({super.key, required this.instance});

  final ProjectData instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Evaluation Time",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .018,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: AppColors.primarySwatchColor,
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: EvaluationViewBody(
        projectId: instance.id!,
      ),
    );
  }
}
