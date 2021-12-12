
class ApiSettings{

  static const String _baseUrl= "https://smart-store.mr-dev.tech/";

  static const String _apiUrl= _baseUrl + "api/";

  static const String register = _apiUrl + "auth/register";
  static const String storeApiKey = "757a7c0c-829a-4f7a-b7f0-73a49debfede";
  static const String activatePhone = _apiUrl + "auth/activate";

  static const String login = _apiUrl + "auth/login";
  static const String logout = _apiUrl + "auth/logout";

  static const String forgetPassword = _apiUrl + "auth/forget-password";
  static const String resetPassword = _apiUrl + "auth/reset-password";
  static const String updateProfile = _apiUrl + "auth/update-profile";
  static const String changePassword = _apiUrl + "auth/change-password";

  static const String home = _apiUrl + "home";
  static const String category = _apiUrl + "categories";
  static const String subCategory = _apiUrl + "categories/";
  static const String productRead = _apiUrl + "sub-categories/";
  static const String productDetail = _apiUrl + "products/";

  static const String city = _apiUrl + "cities";

  static const String faqs = _apiUrl + "faqs";

}