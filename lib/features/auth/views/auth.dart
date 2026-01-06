import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/auth/views/signin.dart';
import 'package:monprojet/features/auth/views/signup.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';

class AuthView extends StatefulWidget {
  final UsersRepository usersRepository;
  final OrdersRepository ordersRepository;
  const AuthView({super.key, required this.usersRepository, required this.ordersRepository});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {

  bool isSignup = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auth')),
      body: isSignup ? SignupForm(usersRepository: widget.usersRepository, ordersRepository: widget.ordersRepository) : SigninForm(usersRepository: widget.usersRepository, ordersRepository: widget.ordersRepository),
    );
  }
}
