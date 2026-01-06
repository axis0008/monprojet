import 'package:monprojet/features/orders/data/models/order_model.dart';

class OrdersRepository {
  List<OrderModel> orders = [];

  // get all orders
  List<OrderModel> getOrders() {
    return orders;
  }

  // get order by id
  OrderModel getOrderById(String id) {
    return orders.firstWhere((order) => order.id == id);
  }

  // create order
  OrderModel createOrder(OrderModel order) {
    orders.add(order);
    return order;
  }

  // update order
  OrderModel updateOrder(String id, {String? product, int? quantity}) {
    var order = getOrderById(id);
    var updatedOrder = OrderModel(
      id: order.id,
      userId: order.userId,
      product: product ?? order.product,
      quantity: quantity ?? order.quantity,
      created: order.created,
    );
    orders.remove(order);
    orders.add(updatedOrder);
    return updatedOrder;
  }

  // delete order
  void deleteOrder(String id) {
    orders.removeWhere((order) => order.id == id);
  }
}
