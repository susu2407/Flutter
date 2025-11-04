
import 'package:flutter/cupertino.dart';
import 'package:kmarket_shopping_app/services/token_storage_service.dart';

class AuthProvider with ChangeNotifier {

  final _tokenStorageService = TokenStorageService();

  bool _isLoggedIn = false; // 로그인 여부 상태 (기본적으로 로그아웃 false 상태)

  bool get isLoggedIn => _isLoggedIn; // Getter

  AuthProvider(){
    _checkLoginStatus();  // 앱 실행시 로그인 여부 검사
  }

  Future<void> _checkLoginStatus() async {
    final token = await _tokenStorageService.readToken();

    if(token != null){
      _isLoggedIn = true; // token이 not null이면 login 상태(true)로 변경.
      notifyListeners(); // 해당 Provicer를 구독하고 있는 Cunsumer에게 알림 // (상태가 바뀌었다고 아래 위젯들(cunsumer)에게 알림)
    }
  }

  Future<void> login(String token) async {
    _tokenStorageService.savedToken(token);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _tokenStorageService.deleteToken();
    _isLoggedIn = false;
    notifyListeners();
  }
}