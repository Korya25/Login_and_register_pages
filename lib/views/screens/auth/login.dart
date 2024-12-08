import 'package:flutter/material.dart';
import 'package:login_and_register_pages/views/screens/auth/register_page.dart';
import 'package:login_and_register_pages/views/widget/custom_forget_password.dart';
import 'package:login_and_register_pages/views/widget/custom_loginor_signup_button.dart';
import 'package:login_and_register_pages/views/widget/custom_text_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  /// Controllers for email and password fields.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Form key for validation.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Login method to handle login functionality.
  void _login(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Add your login logic here.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    }
  }

  /// Navigate to the Register page.
  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  /// Check password strength
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Validate email format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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

                // Welcome Back Message
                Text(
                  'Welcome back, you have been missed!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),

                // Email Text Field
                CustomTextFormField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                  validator: _validateEmail,
                  onSaved: (String) {},
                ),
                const SizedBox(height: 10),

                // Password Text Field
                CustomTextFormField(
                  hintText: 'Password',
                  hasSuffixIcon: true,
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _passwordController,
                  obscureText: true,
                  validator: _validatePassword,
                  onSaved: (String) {},
                ),
                const SizedBox(height: 7),

                // Forget Password
                CustomForgetPassword(
                  onResetPassword: () {
                    // Add forget password logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password tapped')),
                    );
                  },
                ),
                const SizedBox(height: 50),

                // Login Button
                CustomLoginorSignupButton(
                  text: 'Login',
                  onTap: () => _login(context),
                ),
                const SizedBox(height: 25),

                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to app? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _navigateToRegister(context),
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
