import 'package:flutter/material.dart';

import 'depends/textField.dart';
import 'homePage.dart';
import 'registerPage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool validEmail = true;
  bool validPAssword = true;
  String validText = "";

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
    if (value != "exam@modul6.com") {
      setState(() {
        validEmail = false;
        validText = "your email is incorrect";
      });
    } else {
      setState(() {
        validEmail = true;
        validText = "";
      });
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length <= 8) {
      return "Password kamida 8 ta belgi bo'lishi shart";
    }
    if (value != "Modul6exam") {
      setState(() {
        validPAssword = false;
        validText = "your password is incorrect";
      });
    } else {
      setState(() {
        validPAssword = true;
        validText = "";
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage("assets/images/undraw_city_life_gnpr1.png"),
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F4B6B)),
                      children: [
                        TextSpan(text: "Let's "),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "quis nostrud exercitation ullamco laboris nisi ut",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF52577A)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    !(validEmail && validPAssword)
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF234E68),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    validText,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    TextFeild(
                      name: "Email",
                      image: "assets/images/Group.png",
                      helper: false,
                      validate: validateEmail,
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
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          }
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xFF8AC640),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SizedBox(
                            height: 63,
                            width: 278,
                            child: Center(
                              child: Text(
                                "Login",
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
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1,
                    width: 150,
                    child: ColoredBox(
                      color: Color(0xFFECEDF3),
                    ),
                  ),
                  Text(
                    "   OR   ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color(0xFFECEDF3),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    width: 150,
                    child: ColoredBox(
                      color: Color(0xFFECEDF3),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: 158,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F2F7),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset("assets/images/Layout.png"),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 158,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F2F7),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset("assets/images/Layout2.png"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF52577A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        )),
                    child: const Text(
                      " Register",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F4C6B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
