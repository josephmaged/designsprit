import 'package:designsprit/constants.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/features/categories_list/presentation/pages/categories_list.dart';
import 'package:designsprit/features/favorites/presentation/pages/favorites_view.dart';
import 'package:designsprit/features/home/presentation/pages/home_view.dart';
import 'package:designsprit/features/more/presentation/pages/more_page.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const MainScreenState());

  static MainScreenCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const Categories(),
    const FavoritesView(),
    const MorePage(),
  ];

  List<String> screenNames = ["Home", "Categories", "Favorite", "More"];

  List<IconData> bottomItems = [
    Icons.home,
    Icons.category,
    Icons.bookmark_border_rounded,
    Icons.more_vert,
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(state.copyWith(currentIndex: currentIndex));
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      CacheHelper.saveData(key: Constants.uToken, value: token);
    });
  }

  Future<void> refreshToken() async {
    String fuid = CacheHelper.getData(key: Constants.fID);
    print(fuid);
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async  {
      var response = await Dio().post(ApiConst.refreshToken, data: {
        'fuid': fuid,
        'newToken': fcmToken,
      });
      print (response);
    }).onError((handleError){
      print(handleError);
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print('User Declind or has not accepted permission');
    }
  }

  initInfo() {
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationsSettings);
    FirebaseMessaging.instance.subscribeToTopic('General');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifications = AndroidNotificationDetails(
        'designsprit',
        "designsprit",
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifications, iOS: const DarwinNotificationDetails());
      await flutterLocalNotificationsPlugin.show(
          0, message.notification?.title, message.notification?.body, platformChannelSpecifics,
      payload: message.data['body']);
    });

  }

}
