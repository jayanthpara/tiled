import 'package:flutter/material.dart';
import 'home_screen.dart'; // Make sure this path is correct based on your project structure

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final backPressedTwice =
            lastPressed == null || now.difference(lastPressed!) > Duration(seconds: 2);

        if (backPressedTwice) {
          lastPressed = now;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Press back again to exit')));
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_userController.text == 'admin' &&
                          _passController.text == 'admin') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid credentials')),
                        );
                      }
                    },
                    child: Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
