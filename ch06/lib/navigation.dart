import 'package:flutter/material.dart';

// 페이지 모델 : 현재 앱의 상태를 나타내는 모델
class AppRoutePath {
  final bool isHomePage;
  final int? itemId;

  AppRoutePath.home()
      : isHomePage = true,
        itemId = null;

  AppRoutePath.detail(this.itemId) : isHomePage = false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteParser(),
    );
  }
}

/// 라우터 정보 파서 (MyRouteInformationParser) : URL(문자열)과 앱의 상태(페이지 모델) 간의 변환을 담당
class AppRouteParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');


    if (uri.pathSegments.isEmpty) {
      return AppRoutePath.home();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'detail') {
      final id = int.tryParse(uri.pathSegments[1]);
      if (id != null) {
        return AppRoutePath.detail(id);
      }
    }

    return AppRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/');
    } else {
      return RouteInformation(location: '/detail/${configuration.itemId}');
    }
  }
}

/// 라우터 딜리게이트 (MyRouterDelegate) : 현재 상태(MyPage)에 따라 어떤 Page 위젯 스택을 표시할지 결정하고, 상태 변경 로직을 처리
class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool _isHomePage = true;
  int? _selectedItemId;

  @override
  AppRoutePath get currentConfiguration {
    if (_isHomePage) {
      return AppRoutePath.home();
    } else {
      return AppRoutePath.detail(_selectedItemId);
    }
  }

  void _handleItemTapped(int id) {
    _selectedItemId = id;
    _isHomePage = false;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    List<Page> pages = [
      MaterialPage(
        key: const ValueKey('HomePage'),
        child: HomePage(
          onGoToDetail: () {
            _handleItemTapped(1);
          }
        ),
      ),
    ];

    if (!_isHomePage && _selectedItemId != null) {
      pages.add(
        MaterialPage(
          key: ValueKey('DetailPage-$_selectedItemId'),
          child: DetailPage(
            itemId: _selectedItemId!,
            onBack: () {
              _isHomePage = true;
              notifyListeners();
            },
          ),
        ),
      );
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _isHomePage = true;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isHomePage) {
      _isHomePage = true;
      _selectedItemId = null;
    } else {
      _isHomePage = false;
      _selectedItemId = configuration.itemId;
    }
  }
}

/// HomePage
class HomePage extends StatelessWidget {
  final VoidCallback onGoToDetail;

  const HomePage({super.key, required this.onGoToDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '상품번호'
            ),
          ),
          ElevatedButton(
            onPressed: onGoToDetail,
            child: const Text('상세 페이지로 이동'),
          ),
        ],
      ),
    );
  }
}

/// DetailsPage
class DetailPage extends StatelessWidget {
  final int itemId;
  final VoidCallback onBack;

  const DetailPage({
    super.key,
    required this.itemId,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page $itemId'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Center(
        child: Text('Item $itemId의 상세 페이지입니다.'),
      ),
    );
  }
}