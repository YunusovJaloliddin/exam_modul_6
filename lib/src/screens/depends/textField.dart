import 'package:flutter/material.dart';

class TextFeild extends StatefulWidget {
  String name;
  String image;
  bool helper;

  String? Function(String? value) validate;

  TextFeild({
    required this.name,
    required this.image,
    required this.helper,
    required this.validate,
    Key? key,
  });

  @override
  State<TextFeild> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFeild> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure && widget.helper,
      textInputAction: TextInputAction.next,
      validator: widget.validate,
      decoration: InputDecoration(
        hintText: widget.name,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA1A5C1),
        ),
        helperText: widget.helper ? "Forgot password?" : null,
        helperStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Color(0xFF1F4B6B),
        ),
        counter: widget.helper
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: const Text(
                  "Show password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF1F4B6B),
                  ),
                ),
              )
            : null,
        suffixIcon: Image.asset(widget.image),
        filled: true,
        fillColor: const Color(0xFFF3F2F7),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF3E6E5E),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
