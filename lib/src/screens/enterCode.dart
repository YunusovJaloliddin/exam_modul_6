
import 'package:flutter/material.dart';


class EnterCode extends StatefulWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  State<EnterCode> createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {
  bool validPassword=true;

  void validate(String? value) {
    if (value != "0") {
      setState(() {
        validPassword=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll<Size>(
                              Size.fromRadius(25)),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color(0xFFF3F2F7))),
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.black,
                      )),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F4B6B)),
                    children: [
                      TextSpan(text: "Enter the "),
                      TextSpan(
                        text: "code",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 12, color: Color(0xFF1F4B6B)),
                      children: [
                        TextSpan(
                            text:
                                "Enter the 4 digit code that we just sent to\n"),
                        TextSpan(
                          text: "jonathan@email.com",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
