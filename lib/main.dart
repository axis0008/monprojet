import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/auth/views/auth.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';

void main() {
  var ordersRepository = OrdersRepository();
  var usersRepository = UsersRepository();

  runApp(MainApp(ordersRepository: ordersRepository, usersRepository: usersRepository));
}

class MainApp extends StatelessWidget {
  final OrdersRepository ordersRepository;
  final UsersRepository usersRepository;
  const MainApp({super.key, required this.ordersRepository, required this.usersRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthView(usersRepository: usersRepository, ordersRepository: ordersRepository),
    );
  }
}
