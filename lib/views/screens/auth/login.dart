import 'package:flutter/material.dart';
import 'package:login_and_register_pages/views/widget/custom_forget_password.dart';
import 'package:login_and_register_pages/views/widget/custom_loginor_signup_button.dart';
import 'package:login_and_register_pages/views/widget/custom_text_form_field.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  // Email and Pw controller
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _pwTextEditingController =
      TextEditingController();

  // Form Key
  GlobalKey<FormState> formkey = GlobalKey();

  // Login method
  void login() {}
  // tap to go to register page

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Form(
          key: formkey,
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
              CustomTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textEditingController: _emailTextEditingController,
                onSaved: (value) {},
                validator: (value) {
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Pw Text Field
              CustomTextFormField(
                hintText: 'Password',
                textEditingController: _pwTextEditingController,
                onSaved: (value) {},
                validator: (String) {
                  return null;
                },
              ),

              const SizedBox(height: 7),

              // Forget Password
              const CustomForgetPassword(),

              const SizedBox(height: 50),

              // Login Button
              CustomLoginorSignupButton(
                text: 'Login',
                onTap: () => login,
              ),

              // Register Now
            ],
          ),
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
