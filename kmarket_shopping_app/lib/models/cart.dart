import 'package:kmarket_shopping_app/models/product.dart';

class Cart {

  // 객체 생성
  final int cartId;
  final String userid;
  final Product product;
  final int quantity;

  // 생성자 생성
  Cart({
    required this.cartId,
    required this.userid,
    required this.product,
    required this.quantity
  });

  // JSON <-> 객체 변환
  factory Cart.fromJson(Map<String, dynamic> json) {

    final product = json['product'] as Map<String, dynamic>;

    return Cart(
        cartId: json['cartId'],
        userid: json['userid'],
        product: Product.fromJson(product),
        quantity: json['quantity']
    );
  }

}
