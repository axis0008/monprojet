import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';
import 'package:monprojet/features/orders/views/orders_view.dart';

class HomePage extends StatefulWidget {
  final OrdersRepository ordersRepository;
  final UsersRepository usersRepository;
  const HomePage({super.key, required this.ordersRepository, required this.usersRepository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return OrdersView(ordersRepository: widget.ordersRepository, usersRepository: widget.usersRepository);
  }
}
