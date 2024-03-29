import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/features/aboutus/about_us.dart';
import 'package:designsprit/features/add_appointment/presentation/cubit/add_appointment_cubit.dart';
import 'package:designsprit/features/add_appointment/presentation/pages/add_appointment.dart';
import 'package:designsprit/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:designsprit/features/auth/login/presentation/pages/login_view.dart';
import 'package:designsprit/features/auth/register/presentation/pages/register_view.dart';
import 'package:designsprit/features/categories_list/presentation/cubit/categories_cubit.dart';
import 'package:designsprit/features/categories_list/presentation/pages/categories_list.dart';
import 'package:designsprit/features/change_password/cubit/change_password_cubit.dart';
import 'package:designsprit/features/change_password/pages/change_password.dart';
import 'package:designsprit/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:designsprit/features/chat/presentation/pages/chat_view.dart';
import 'package:designsprit/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:designsprit/features/item_details/presentation/cubit/item_cubit.dart';
import 'package:designsprit/features/item_details/presentation/pages/details_screen.dart';
import 'package:designsprit/features/items_list/presentation/cubit/items_list_cubit.dart';
import 'package:designsprit/features/items_list/presentation/pages/items_list.dart';
import 'package:designsprit/features/main_screen/page/main_screen_view.dart';
import 'package:designsprit/features/notifications/data/models/notification_model.dart';
import 'package:designsprit/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:designsprit/features/notifications/presentation/pages/notifications_view.dart';
import 'package:designsprit/features/notifications/presentation/widgets/notification_details.dart';
import 'package:designsprit/features/onboarding/presentation/pages/onboarding_view.dart';
import 'package:designsprit/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:designsprit/features/profile/presentation/pages/profile_view.dart';
import 'package:designsprit/features/project_status/presentation/cubit/status_cubit.dart';
import 'package:designsprit/features/project_status/presentation/pages/timeline_status_view.dart';
import 'package:designsprit/features/project_status/presentation/widgets/custom_stepper.dart';
import 'package:designsprit/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kMainScreenView = '/mainScreenView';
  static const kLoginView = '/loginView';
  static const konBoardingView = '/onBoarding';
  static const kSearchView = '/searchView';
  static const kRegisterView = '/registerView';
  static const kAppointmentView = '/addAppointment';
  static const kProfileView = '/profileView';
  static const kProjectsView = '/timelineView';
  static const kItemDetailsView = '/itemDetailsView';
  static const kItemsListView = '/itemsListView';
  static const kChangePasswordView = '/changePasswordView';
  static const kFavoritesView = '/favoritesView';
  static const kNotificationsView = '/notificationsView';
  static const kNotificationDetailsView = '/notificationDetailsView';
  static const kStepsView = '/StepsView';
  static const kCategoriesView = '/CategoriesView';
  static const kChatView = '/ChatView';
  static const kAboutUsView = '/AboutUsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => ScreenUtilInit(
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          builder: (BuildContext context, Widget? child) {
            return const SplashView();
          },
        ),
      ),
      GoRoute(
        path: konBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kMainScreenView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<NotificationsCubit>(),
          child: const MainScreenView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ProfileCubit>()..setUserData(),
          child: const ProfileView(),
        ),
      ),
      GoRoute(
        path: kProjectsView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<StatusCubit>()..getProjects()..getInstallments(),
          child: const TimelineView(),
        ),
      ),
      GoRoute(
        path: kStepsView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<StatusCubit>(),
          child: const CustomStepper(),
        ),
      ),
      GoRoute(
        path: kAppointmentView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) => sl<AddAppointmentCubit>()..getFamilies()..getCategories()),
          BlocProvider(
            create: (context) => sl<FavoritesCubit>()..getFavorites(),
          ),
        ], child: const AddAppointment()),
      ),
      GoRoute(
        path: "$kItemDetailsView/:id",
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ItemCubit>()
            ..getItemDetails(
              id: state.params['id']!,
            )
            ..getItemImages(
              id: state.params['id']!,
            ),
          child: DetailsScreen(itemId: state.params['id']!),
        ),
      ),
      GoRoute(
        path: "$kItemsListView/:id",
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ItemsListCubit>()
            ..getItemsList(
              categoryId: state.params['id']!,
            ),
          child: ItemsList(categoryId: state.params['id']!),
        ),
      ),
      GoRoute(
        path: "$kCategoriesView/:id",
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CategoriesCubit>()
            ..getCategories(
              id: state.params['id']!,
            ),
          child: CategoriesListView(categoryId: state.params['id']!),
        ),
      ),
      GoRoute(
        path: kChangePasswordView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ChangePasswordCubit>(),
          child: ChangePassword(),
        ),
      ),
      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<NotificationsCubit>()..getNotifications(),
          child: const Notifications(),
        ),
      ),
      GoRoute(
        path: kNotificationDetailsView,
        builder: (context, state) {
          NotificationsModel notification = state.extra as NotificationsModel;
          return BlocProvider(
            create: (context) => sl<NotificationsCubit>(),
            child: NotificationDetails(
              notification: notification,
            ),
          );
        },
      ),
      GoRoute(
        path: kChatView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => sl<ChatCubit>()..getChat(),
            child: const ChatContent(),
          );
        },
      ),
      GoRoute(
        path: kAboutUsView,
        builder: (context, state) {
          return const AboutUs();
        },
      ),
    ],
  );
}
