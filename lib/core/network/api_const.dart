import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';

class ApiConst {
  static const String baseUrl = 'http://167.86.119.94:4500/api';

  static const String registerPath = '$baseUrl/Auth/Register';
  static String loginPath(String parameters) => '$baseUrl/Auth/login?$parameters';
  static const String getRandomCategories = '$baseUrl/Home/GetRandomCategory';
  static const String GetRandomItems = '$baseUrl/Home/GetRandomItems';
  static String getItemById(int parameters) => '$baseUrl/Item/getItembyid/$parameters';
  static String getProjectSteps(String parameters) => '$baseUrl/ProjectTrack/GetProjectTracks/$parameters';
}