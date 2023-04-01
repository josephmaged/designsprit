class ApiConst {
  static const String baseUrl = 'http://167.86.119.94:4500';
  static const String baseUrlApi = '$baseUrl/api';

  static String getImages(String parameters) => '$baseUrl/imges/$parameters';

  static const String registerPath = '$baseUrlApi/Auth/Register';
  static String loginPath(String parameters) => '$baseUrlApi/Auth/login/$parameters';

  static const String getRandomCategories = '$baseUrlApi/Home/GetRandomCategory';
  static const String getRandomItems = '$baseUrlApi/Home/GetRandomItems';

  static String getItemById(String parameters) => '$baseUrlApi/Item/getItembyid/$parameters';

  static String getItemImageById(String parameters) => '$baseUrlApi/Item/getItemImagebyItemid?Itemid=$parameters';

  static String updateItem = '$baseUrlApi/UserLike/AddUserliked';

  static String getProjectSteps(String parameters) => '$baseUrlApi/ProjectTrack/GetProjectTracks/$parameters';

  static String getItemsByCategoryId(String parameters) =>
      '$baseUrlApi/Item/getItembyCategoryid?Categoryid=$parameters';

  static String getFavorites(int parameters) =>
      '$baseUrlApi/UserLike/UserLikes?userId=$parameters';

  static const String updateProjectSteps = '$baseUrlApi/ProjectTrack/SetProjectTrackStatus';

  static const String updateUserData = '$baseUrlApi/Auth/UpdateProfile';

  // Request
 static const String getCategories = '$baseUrlApi/Category/GetCategories';
 static const String getCountries = '$baseUrlApi/Request/GetCountries';
 static const String getGovernments = '$baseUrlApi/Request/GetGovernmentes';
 static const String getRegions = '$baseUrlApi/Request/GetRegions';
 static const String getTimeSheet = '$baseUrlApi/TimeSheet/getNotReserved';
 static const String setAppointment = '$baseUrlApi/Request/AddRequest';
}
