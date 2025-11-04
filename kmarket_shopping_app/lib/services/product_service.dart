
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {

  final String baseUrl = 'http://10.0.2.2:8080/ch09';

  Future<Map<String, dynamic>> fetchProductList(int category, int pg) async {

    try{
      final response = await http.get(Uri.parse('baseUrl/product?category=$category&pg=$pg'));

      if(response.statusCode == 200) {
        // 성공했을 때
        final jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        throw Exception(response.statusCode);
      }

    }catch(err){
      // 통신이 잘못 되었을 때
      throw Exception(err);
    }
  }


}