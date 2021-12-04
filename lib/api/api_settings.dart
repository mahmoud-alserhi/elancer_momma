
class ApiSettings{

  static const _baseUrl= "https://smart-store.mr-dev.tech/";

  static const _apiUrl= _baseUrl + "api/";

  static const register = _apiUrl + "auth/register";
  static const storeApiKey = "757a7c0c-829a-4f7a-b7f0-73a49debfede";
  static const activatePhone = _apiUrl + "auth/activate";

  static const login = _apiUrl + "auth/login";
  static const logout = _apiUrl + "auth/logout";

  static const forgetPassword = _apiUrl + "auth/forget-password";
  static const resetPassword = _apiUrl + "auth/reset-password";

  static const city = _apiUrl + "cities";

}