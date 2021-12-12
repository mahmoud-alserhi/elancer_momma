import 'dart:convert';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/categories/category.dart';
import 'package:elancer_momma/models/api/faqs/faqs.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class FaqsApiController with Helpers{

  Future<List<Faqs>> showFAQs() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(url,
        headers: headers
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      var faqsJsonArray = jsonDecode(response.body)['list'] as List;
      return faqsJsonArray
          .map((jsonObject) => Faqs.fromJson(jsonObject))
          .toList();
    }
    // print(jsonDecode(response.body));
    return [];
  }

}