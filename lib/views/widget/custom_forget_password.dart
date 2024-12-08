import 'package:flutter/material.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});
  // Reset Password
  void resetPassword() {}
  @override

  // Build UI
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: GestureDetector(
          onTap: resetPassword,
          child: Text(
            "Forget Password?",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
