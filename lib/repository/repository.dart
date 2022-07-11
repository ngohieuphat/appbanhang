import 'dart:convert';
import 'package:banhang/model/grocery_model.dart';
import 'package:http/http.dart' as http;
//kho luu tru call api 
class Repo {
  static Future<GroceryModel?> getData() async {
    String url = 'https://panel.supplyline.network/api/product/search-suggestions/?limit=100&offset=100';
    final response = await http.Client().get(Uri.parse(url));
    if(response.statusCode != 200){
      throw Exception();
    } else {
      print(response.body);
      return groceryModelFromJson(utf8.decode(response.bodyBytes));
    }
  }
}