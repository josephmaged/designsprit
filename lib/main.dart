import 'dart:ui';

import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/bloc_observer.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/service_locator.dart';
import 'package:designsprit/core/utils/theme.dart';
import 'package:designsprit/features/categories_list/presentation/cubit/categories_cubit.dart';
import 'package:designsprit/features/home/presentation/cubit/home_cubit.dart';
import 'package:designsprit/features/main_screen/cubit/main_screen_cubit.dart';
import 'package:designsprit/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Background');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SetupServiceLocator().init();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await CacheHelper.init();

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MainScreenCubit>()
            ..requestPermission()
            ..getToken()
            ..initInfo()
            ..refreshToken(),
        ),
        BlocProvider(
          create: (context) => sl<HomeCubit>()
            ..getFamilies()
            ..getIPopulars(),
        ),/*
        BlocProvider(
          create: (context) => sl<CategoriesCubit>()..getCategories(),
        ),*/
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: lightTheme,
      ),
    );
  }
}
