class ApiConst {
  static const String baseUrl = 'http://167.86.119.94:4500';
  static const String baseUrlApi = '$baseUrl/api';

  static const String registerPath = '$baseUrlApi/Auth/Register';

  static String loginPath(String parameters) => '$baseUrlApi/Auth/login?$parameters';
  static const String getRandomCategories = '$baseUrlApi/Home/GetRandomCategory';
  static const String getRandomItems = '$baseUrlApi/Home/GetRandomItems';

  static String getItemById(String parameters) => '$baseUrlApi/Item/getItembyid/$parameters';
  static String getItemImageById(String parameters) => '$baseUrlApi/Item/getItemImagebyItemid?Itemid=$parameters';

  static String getProjectSteps(String parameters) => '$baseUrlApi/ProjectTrack/GetProjectTracks/$parameters';

  static String getImages(String parameters) => '$baseUrl/imges/$parameters';

  static String getItemsByCategoryId(String parameters) =>
      '$baseUrlApi/Item/getItembyCategoryid?Categoryid=$parameters';
}
