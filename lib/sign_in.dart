import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isPhone = screenWidth < screenHeight;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: isPhone ? screenWidth * 8 / 10 : screenWidth * 2 / 5,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Welcome to Inventory",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: isPhone ? screenWidth * 7 / 10 : screenWidth * 3 / 10,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                width: isPhone ? screenWidth * 7 / 10 : screenWidth * 3 / 10,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                width: isPhone ? screenWidth * 7 / 10 : screenWidth * 3 / 10,
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: isPhone ? screenWidth * 7 / 10 : screenWidth * 3 / 10,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                  child: Text("Sign in"),
                ),
              ),
              Container(
                child: Text(
                  'Not on Inventory yet? Sign up',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
