import 'package:monprojet/features/orders/domain/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.userId,
    required super.product,
    required super.quantity,
    required super.created,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['userId'],
      product: json['product'],
      quantity: json['quantity'],
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'product': product,
      'quantity': quantity,
      'created': created.toIso8601String(),
    };
  }
}
