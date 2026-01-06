import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/orders/data/models/order_model.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';

class OrdersView extends StatefulWidget {
  final OrdersRepository ordersRepository;
  final UsersRepository usersRepository;
  const OrdersView({super.key, required this.ordersRepository, required this.usersRepository});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order List: ${widget.usersRepository.currentUser?.name}')),
      body: ListView(
        children: [
          for (var order in widget.ordersRepository.getOrders())
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text(order.product),
              subtitle: Text('Quantity: ${order.quantity} - Created: ${order.created.toString()}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // edit button
                  IconButton(
                    onPressed: () async {
                      final result = await showDialog<Map<String, dynamic>>(
                        context: context,
                        builder: (context) {
                          var productController = TextEditingController(text: order.product);
                          var quantityController = TextEditingController(text: order.quantity.toString());
                          return AlertDialog(
                            title: Text('Edit order'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: productController,
                                  decoration: InputDecoration(labelText: 'Product'),
                                ),
                                TextField(
                                  controller: quantityController,
                                  decoration: InputDecoration(labelText: 'Quantity'),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, {
                                  'product': productController.text,
                                  'quantity': int.tryParse(quantityController.text) ?? order.quantity,
                                }),
                                child: Text('Update'),
                              ),
                              TextButton(onPressed: () => Navigator.pop(context, null), child: Text('Cancel')),
                            ],
                          );
                        },
                      );

                      if (result != null) {
                        widget.ordersRepository.updateOrder(
                          order.id,
                          product: result['product'],
                          quantity: result['quantity'],
                        );
                        setState(() {});
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.ordersRepository.deleteOrder(order.id);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (context) {
              var productController = TextEditingController();
              var quantityController = TextEditingController();
              return AlertDialog(
                title: Text('Add order'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: productController,
                      decoration: InputDecoration(labelText: 'Product'),
                    ),
                    TextField(
                      controller: quantityController,
                      decoration: InputDecoration(labelText: 'Quantity'),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, {
                      'product': productController.text,
                      'quantity': int.tryParse(quantityController.text) ?? 1,
                    }),
                    child: Text('Add'),
                  ),
                  TextButton(onPressed: () => Navigator.pop(context, null), child: Text('Cancel')),
                ],
              );
            },
          );

          if (result != null && result['product'] != null && result['product'].isNotEmpty) {
            widget.ordersRepository.createOrder(
              OrderModel(
                id: DateTime.now().microsecondsSinceEpoch.toString(),
                userId: widget.usersRepository.currentUser?.id ?? '',
                product: result['product'],
                quantity: result['quantity'],
                created: DateTime.now(),
              ),
            );
            setState(() {});
          }
        },
        child: Text('Add'),
      ),
    );
  }
}
