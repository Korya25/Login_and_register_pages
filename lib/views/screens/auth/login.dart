import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // Email and Pw controller

  // Login method

  // tap to go to register page

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Welcom Back Message
            Text(
              'Welcom back, you have been missed!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            // Email Text Field

            // Pw Text Field

            // Login Button

            // Register Now
          ],
        ),
      ),
    );
  }
}
/*
import 'package:chat/auth/auth_service.dart';
import 'package:chat/component/my_button.dart';
import 'package:chat/component/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Email and Ps controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _psController = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  // Login method
  void login(BuildContext context) async {
    //  auth services
    final authService = AuthService();

    // try  login
    try {
      authService.signInWithEmailAndPassword(
          _emailController.text, _psController.text);
    }
    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Welcom back message
            Text(
              'Welcom back, you have been missed!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Email textfirld
            MyTextField(
              hinText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // Ps textfirld
            MyTextField(
              hinText: 'Password',
              obscureText: true,
              controller: _psController,
            ),

            const SizedBox(height: 25),

            // Login Button
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

*/