import 'package:flutter/material.dart';
import 'login_page.dart';
import 'user.dart';

class HomePage extends StatelessWidget {
  final User user;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  HomePage({required this.user});

  void handleLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => handleLogout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome, ${user.firstName} ${user.lastName}!'),
            const SizedBox(height: 16.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(height: 16.0),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Username: ${user.username}'),
          ],
        ),
      ),
    );
  }
}
