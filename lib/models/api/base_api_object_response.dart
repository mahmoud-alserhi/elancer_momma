import 'package:elancer_momma/models/api/base_api_response.dart';
import 'package:elancer_momma/models/api/home_response.dart';
import 'package:elancer_momma/models/api/user.dart';

class BaseApiObjectResponse<T> extends BaseApiResponse {
  late T object;
  late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json.containsKey('data')) {
      if (T == User) {
        data = User.fromJson(json['data']) as T;
      } else if (T == HomeResponse) {
        data = HomeResponse.fromJson(json['data']) as T;
      }
    }
    if (json.containsKey('object')) {}
  }
}
