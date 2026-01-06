import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key, required this.usersRepository, required this.ordersRepository});
  final UsersRepository usersRepository;
  final OrdersRepository ordersRepository;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(labelText: 'Email'),),
          TextFormField(decoration: InputDecoration(labelText: 'Password'),),
        ],
      ),
    );
  }
}
