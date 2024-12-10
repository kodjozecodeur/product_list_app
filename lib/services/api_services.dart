import 'dart:convert'; // Add this to handle JSON decoding

import 'package:http/http.dart' as http;
import 'package:product_list_app/models/product_model.dart';

class ApiServices {
  Future<List<ProductsModel>?> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      // Decode the JSON response as a list and map each item to ProductsModel
      List<dynamic> jsonData = jsonDecode(json);
      return jsonData.map((item) => ProductsModel.fromJson(item)).toList();
    }

    return null; // Return null if the response is not successful
  }
}
