import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/features/about_app/presentation/views/about_app_view.dart';
import 'package:resithon_event/features/auth/presentation/views/login_view.dart';
import 'package:resithon_event/features/onboarding/presentaion/views/onboarding_screen.dart';
import 'package:resithon_event/features/sessions/presentations/views/see_more_sessions_view.dart';
import 'package:resithon_event/features/videos/presentation/views/videos_view.dart';
import '../../../features/agenda/presentation/views/agenda_view.dart';
import '../../../features/my_schedule/presentation/views/schedule_view.dart';
import '../../../features/notifications/presentation/views/notifications_views.dart';
import '../../../features/orginizer/food/presentation/views/food_view.dart';
import '../../../features/orginizer/home/presentation/views/organizer_home_view.dart';
import '../../../features/profile/presentation/views/edit_ptofile_view.dart';
import '../../../features/profile/presentation/views/profile_view.dart';
import '../../../features/speakers/chat/presentation/views/chat_list_view.dart';
import '../../../features/speakers/chat/presentation/views/chat_messages_details.dart';
import '../../../features/speakers/home/presentation/views/speaker_home_view.dart';
import '../../../features/splash/presentation/views/splash_secondary_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';
import '../../../features/user/home/presentation/views/user_home_view.dart';
import '../../../features/user/projects/presentation/views/projects_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    //General Roots
    GoRoute(
      path: "/aboutAppView",
      builder: (context, state) => const AboutAppView(),
    ),


    //Splash Roots
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/splashSecondary",
      builder: (context, state) => const SplashSecondary(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const SplashSecondary(),
      ),
    ),


    //Onboarding Roots
    GoRoute(
      path: "/onBoardingView",
      builder: (context, state) => const OnBoardingView(),
    ),


    //Auth Roots
    GoRoute(
      path: "/loginView",
      builder: (context, state) => const LoginView(),
    ),


    //User Roots
    GoRoute(
      path: "/userHomeView",
      builder: (context, state) => const UserHomeView(),
    ),
    // GoRoute(
    //   path: "/userSessionDetailsView",
    //   builder: (context, state) => const UserSessionDetailsView(),
    // ),
    GoRoute(
      path: "/agendaView",
      builder: (context, state) => const AgendaView(),
    ),
    GoRoute(
      path: "/videosView",
      builder: (context, state) => const VideosView(),
    ),
    GoRoute(
      path: "/projectsView",
      builder: (context, state) => const ProjectsView(),
    ),
    // GoRoute(
    //   path: "/evaluationView",
    //   builder: (context, state) => const EvaluationView(),
    // ),
    GoRoute(
      path: "/scheduleView",
      builder: (context, state) => const ScheduleView(),
    ),
    //Speaker Roots
    GoRoute(
      path: "/speakerHomeView",
      builder: (context, state) => const SpeakerHomeView(),
    ),
    // GoRoute(
    //   path: "/speakerPublicChatView",
    //   builder: (context, state) =>   SpeakerPublicChatView(
    //     groupImage: state["groupImage"],
    //     groupName: state["groupName"],
    //   ),
    // ),
    //  GoRoute(
    //   path: "/speakerSessionDetailsView",
    //   builder: (context, state) => const SpeakerSessionDetailsView(),
    // ),
    GoRoute(
      path: "/foodView",
      builder: (context, state) => const FoodView(),
    ),
    // GoRoute(
    //  path: "/speakerChatView",
    //   builder: (context, state) =>   SpeakerChatView(),
    // ),
    // GoRoute(
    //   path: "/chatListView",
    //   builder: (context, state) => const ChatListView(),
    // ),
    // GoRoute(
    //   path: "/chatMessagesDetails",
    //   builder: (context, state) => const ChatMessagesDetails(),
    // ),
    GoRoute(
      path: "/notificationsViews",
      builder: (context, state) => const NotificationsViews(),
    ),
    GoRoute(
      path: "/profileView",
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: "/editProfileView",
      builder: (context, state) => const EditProfileView(),
    ), GoRoute(
      path: "/seeMoreSessionsView",
      builder: (context, state) => const SeeMoreSessionsView(),
    ),


    //Organizer Roots
    GoRoute(
      path: "/organizerHomeView",
      builder: (context, state) => const OrganizerHomeView(),
    ),
    // GoRoute(
    //   path: "/organizerSessionDetailsView",
    //   builder: (context, state) => const OrganizerSessionDetailsView(),
    // ),
  ]);
}
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: CurveTween(curve: Curves.easeInCirc).animate(animation), child: child),
  );
}
