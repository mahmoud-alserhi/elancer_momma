import 'package:elancer_momma/models/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum prefKeys{
  loggIn, name, mobile, cityId, gender, token, lang, cityAr,cityEn
}
class SharedPrefController{

  static final SharedPrefController _instance = SharedPrefController._internal();
  SharedPrefController._internal();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController(){
    return _instance;
  }

  Future<void> initPref() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async{
    await _sharedPreferences.setBool(prefKeys.loggIn.toString(), true);
    await _sharedPreferences.setString(prefKeys.name.toString(), user.name);
    await _sharedPreferences.setString(prefKeys.mobile.toString(), user.mobile);
    await _sharedPreferences.setInt(prefKeys.cityId.toString(), user.cityId);
    await _sharedPreferences.setString(prefKeys.cityEn.toString(), user.city.nameEn);
    await _sharedPreferences.setString(prefKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPreferences.setString(prefKeys.gender.toString(), user.gender);
    await _sharedPreferences.setString(prefKeys.token.toString(), 'Bearer ' + user.token);
  }

  bool get loggedIn => _sharedPreferences.getBool(prefKeys.loggIn.toString()) ?? false;

  String get token => _sharedPreferences.getString(prefKeys.token.toString()) ?? '';

  Future<void> setLanguage ({required String lang}) async{
    await _sharedPreferences.setString(prefKeys.lang.toString(), lang);
  }                                                                                    //'en
  String get checkLanguage => _sharedPreferences.getString(prefKeys.lang.toString()) ?? 'ar';

  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }
}