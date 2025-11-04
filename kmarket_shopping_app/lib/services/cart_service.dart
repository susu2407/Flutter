import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kmarket_shopping_app/config/app_config.dart';
import 'package:kmarket_shopping_app/services/token_storage_service.dart';

class CartService {

  // 토큰을 받아야 한다 -> JWT
  final _tokenStorageService = TokenStorageService(); // 너무 기니깐 타입은 뺄게요. 빼도 되더라구요.

  Future<Map<String, dynamic>> addCart(int pno, int quantity) async {

    try{
      // JWT 가져오기
      final jwt = await _tokenStorageService.readToken();
      log('jwt : $jwt');

      // 전송 데이터 생성
      final jsonData = {
        "pno": pno,
        "quantity": quantity,
      };

      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/cart'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $jwt"
        },
        body: jsonEncode(jsonData) // addCart에서 모델 클래스로 데이터를 받아 올 것이다.
      );

      // 데이터는 모델 데이터를 하나 만들어야 한다.
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        throw Exception(response.statusCode);
      }

    }catch(err){
      throw Exception(err);
    }

  }
}