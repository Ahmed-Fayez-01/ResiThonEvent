import 'package:easy_localization/easy_localization.dart';
import '../../features/agenda/presentation/view_models/dated_all_sessions_cubit/dated_all_sessions_cubit.dart';
import '../../features/my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';
import '../../features/sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import '../../features/sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../features/user/projects/presentation/view_models/projects_cubit/all_projects_cubit.dart';

void callAllApis(context){
  context.read<AllSessionsCubit>().sessionsDetails();
  context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
  context.read<AllProjectsCubit>().allProjectsDetails();
  context.read<DatedAllSessionsCubit>().datedAllSessionsDetails(query: {
    "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
  });
  context.read<DatedSubscribedSessionsCubit>().datedSubscribedSessionsDetails(query: {
    "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
  });
}