import 'package:designsprit/features/auth/login/domain/use_cases/login_API.dart';

class ApiConst {
  static const String baseUrl = 'https://10.10.100.116:45455/api';

  static const String registerPath = '$baseUrl/Auth/Register';
  static String loginPath(String parameters) => '$baseUrl/Auth/login?$parameters';
 }