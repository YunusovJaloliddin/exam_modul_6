import 'package:flutter/material.dart';

class TextFeild2 extends StatefulWidget {
  bool last;
  String? Function(String? value) validate;
  void Function(String? newValue)? validPassword;

  TextFeild2(
      {required this.validate,
      this.last = false,
      this.validPassword=null,
      Key? key});

  @override
  State<TextFeild2> createState() => _TextFeildState();
}

class _TextFeildState extends State<TextFeild2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextFormField(
        onChanged: widget.validPassword,
        validator: widget.validate,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF3F2F7),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF234E68)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
