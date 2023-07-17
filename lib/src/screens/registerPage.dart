import 'package:flutter/material.dart';

import 'depends/textField.dart';
import 'enterCode.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? validateEmail(String? value) {
    if (value == null) {
      return "Emailda kamida bitta harf bo'lishi kerak";
    }
    if (!RegExp(r'[A-z]+[@]').hasMatch(value!)) {
      return "Email harflardan boshlanishi va @ belgisi bo'lishi shart";
    }
    if (!RegExp(r'[A-z]+[@][A-z]').hasMatch(value)) {
      return "Emailda @ belgidan keyin kamida bitta harf bo'lishi kerak";
    }
    if (!value.contains(".com")) {
      return "Emailda '.com' bo'lishi shart";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length <= 8) {
      return "Password kamida 8 ta belgi bo'lishi shart";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.length <= 3) {
      return "Password kamida 3 ta belgi bo'lishi shart";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll<Size>(Size.fromRadius(25)),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Color(0xFFF3F2F7))),
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
                        TextSpan(text: "Create your "),
                        TextSpan(
                          text: "account",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "quis nostrud exercitation ullamco laboris nisi ut",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF52577A)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: TextFeild(
                      name: "First name",
                      image: "assets/images/Profile.png",
                      helper: false,
                      validate: validateName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextFeild(
                      name: "Email",
                      image: "assets/images/Group.png",
                      helper: false,
                      validate: validateEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFeild(
                      name: "Password",
                      image: "assets/images/Lock.png",
                      helper: true,
                      validate: validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print("Pressed");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterCode(),
                                ));
                          }
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFF8AC640),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            height: 63,
                            width: 278,
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
