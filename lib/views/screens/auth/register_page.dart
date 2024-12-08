import 'package:flutter/material.dart';
import 'package:login_and_register_pages/views/widget/custom_forget_password.dart';
import 'package:login_and_register_pages/views/widget/custom_loginor_signup_button.dart';
import 'package:login_and_register_pages/views/widget/custom_text_form_field.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
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

  RegisterPage({super.key});

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

              const SizedBox(height: 25),

              // Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to app? ',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Regiser Now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
