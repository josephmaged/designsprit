class ApiConst {

  // Base
  static const String baseUrl = 'http://167.86.119.94:4500';
  static const String baseUrlApi = '$baseUrl/api';
  static String getImages(String parameters) => '$baseUrl/imges/$parameters';

  // Auth
  static const String registerPath = '$baseUrlApi/Auth/Register';
  static String loginPath(String parameters) => '$baseUrlApi/Auth/login/$parameters';
  static const String updateUserData = 'http://167.86.119.94:4500/api/Auth/UpdateProfile';

  // Home
  static const String getRandomCategories = '$baseUrlApi/Home/GetRandomCategory';
  static const String getRandomItems = '$baseUrlApi/Home/GetRandomItems';

  // Item Details
  static String getItemById(String parameters) => '$baseUrlApi/Item/getItembyid/$parameters';
  static String getItemImageById({required String itemId, required String fUid}) =>
      '$baseUrlApi/Item/getItemImagebyItemid?Itemid=$itemId&Fuid=$fUid';
  static String updateItem = '$baseUrlApi/UserLike/AddUserliked';

  // Project Tracker
  static String getProjects({required String fuId}) => '$baseUrlApi/ProjectTrack/GetUserProjects?Fuid=$fuId';
  static String getSteps({required int projectId}) =>
      '$baseUrlApi/ProjectTrack/GetUserProjectSteps?projectId=$projectId';
  static const String updateProjectSteps = '$baseUrlApi/ProjectTrack/SetProjectTrackStatus';

  // Item List
  static String getItemsByCategoryId(String parameters) =>
      '$baseUrlApi/Item/getItembyCategoryid?Categoryid=$parameters';

  // Favorites
  static String getFavorites(int parameters) => '$baseUrlApi/UserLike/UserLikes?userId=$parameters';

  // Notifications
  static String getNotifications(String parameters) => '$baseUrlApi/Notification/GetUserNotifications?Fuid=$parameters';
  static String updateNotifications(String parameters) => '$baseUrlApi/Notification/UpdateNotification?notifcationId=$parameters';

  // Request
  static const String getCategories = '$baseUrlApi/Category/GetCategories';
  static const String getCountries = '$baseUrlApi/Request/GetCountries';
  static const String getGovernments = '$baseUrlApi/Request/GetGovernmentes';
  static const String getRegions = '$baseUrlApi/Request/GetRegions';
  static const String getTimeSheet = '$baseUrlApi/TimeSheet/getNotReserved';
  static const String setAppointment = '$baseUrlApi/Request/AddRequest';
}
