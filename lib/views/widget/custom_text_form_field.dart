import 'package:flutter/material.dart';

/// Customizable TextFormField Widget
/// This widget can handle both standard text fields and password fields.
/// - [hintText]: Placeholder text for the field.
/// - [textEditingController]: Controller to manage the field's text.
/// - [obscureText]: Whether the text should be obscured (useful for passwords).
/// - [validator]: Validation function to validate the input.
/// - [hasSuffixIcon]: Whether to show a suffix icon (e.g., for toggling obscureText).
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText = false,
    required this.validator,
    this.hasSuffixIcon = false,
  });

  final String hintText; // Placeholder text
  final bool obscureText; // Whether the text field is for passwords
  final bool hasSuffixIcon; // Show a suffix icon for toggling obscureText
  final String? Function(String?)? validator; // Validation function
  final TextEditingController? textEditingController; // Text field controller

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscureText; // To manage obscureText state locally

  @override
  void initState() {
    super.initState();
    // Initialize obscureText state based on the initial value
    isObscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 25), // Add horizontal padding
      child: TextFormField(
        validator: widget.validator, // Use the passed validator
        controller: widget.textEditingController, // Bind the controller
        obscureText:
            widget.hasSuffixIcon ? isObscureText : false, // Toggle obscureText
        decoration: InputDecoration(
          hintText: widget.hintText, // Set the hint text
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .tertiary), // Default border color
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .primary), // Focused border color
          ),
          fillColor:
              Theme.of(context).colorScheme.secondary, // Background color
          filled: true, // Enable the background color

          // Conditionally show suffix icon for toggling obscureText
          suffixIcon: widget.hasSuffixIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText =
                          !isObscureText; // Toggle obscureText state
                    });
                  },
                  icon: Icon(
                    isObscureText
                        ? Icons.visibility
                        : Icons.visibility_off, // Change icon based on state
                  ),
                )
              : null, // No suffix icon if hasSuffixIcon is false
        ),
      ),
    );
  }
}
