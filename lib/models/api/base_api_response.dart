class BaseApiResponse {
  late bool status;
  late String message;

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    //print('JSON: $json');
    status = json['status'];
    message = json['message'];
  }
}
