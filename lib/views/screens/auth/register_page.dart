import 'package:flutter/material.dart';
import 'package:login_and_register_pages/views/widget/custom_loginor_signup_button.dart';
import 'package:login_and_register_pages/views/widget/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  /// Controllers for input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  /// Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Sign-up method
  void _signup(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Add your sign-up logic here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful')),
      );
    }
  }

  /// Check password strength
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'Password must include upper, lower, digit & symbol';
    }

    return null;
  }

  /// Validate email format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
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

                // Create Account Message
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),

                // Username Field
                CustomTextFormField(
                  onSaved: (String) {},
                  hintText: 'Username',
                  keyboardType: TextInputType.name,
                  textEditingController: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Email Field
                CustomTextFormField(
                  onSaved: (String) {},
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 10),

                // Password Field
                CustomTextFormField(
                  onSaved: (String) {},
                  hasSuffixIcon: true,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _passwordController,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 10),

                // Confirm Password Field
                CustomTextFormField(
                  onSaved: (String) {},
                  hasSuffixIcon: true,
                  hintText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  textEditingController: _confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password cannot be empty';
                    }

                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 50),

                // Register Button
                CustomLoginorSignupButton(
                  text: 'Register',
                  onTap: () => _signup(context),
                ),
                const SizedBox(height: 25),

                // Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login Now',
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
