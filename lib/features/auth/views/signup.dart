import 'package:flutter/material.dart';
import 'package:monprojet/features/auth/data/models/user_model.dart';
import 'package:monprojet/features/auth/data/repositries/users_repositry.dart';
import 'package:monprojet/features/orders/data/repositires/orders_repositry.dart';
import 'package:monprojet/home.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.usersRepository, required this.ordersRepository});
  final UsersRepository usersRepository;
  final OrdersRepository ordersRepository;
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: name,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: email,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: password,
              ),
              TextButton(onPressed: () {
                widget.usersRepository.signUp(
                  UserModel(id: '', name: name.text, email: email.text, password: password.text)
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(ordersRepository: widget.ordersRepository, usersRepository: widget.usersRepository)));
              }, child: Text('Signup')),
            ],
          ),
        ),
      ),
    );
  }
}
