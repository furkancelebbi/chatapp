import 'package:chatappflutter/pages/register_page.dart';
import 'package:chatappflutter/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tell Me",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login now to see what they are talking!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/unnamed.png",
                    width: 200,
                    height: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: textInputDecoreation.copyWith(
                        labelText: "Email", prefix: Icon(Icons.email, color: Theme.of(context).primaryColor)),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });

                      validator:
                      (val) {
                        return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>')
                                .hasMatch(val)
                            ? null
                            : "Please enter a valid email";
                      };
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    obscureText: true,
                    decoration: textInputDecoreation.copyWith(
                        labelText: "Passwrod", prefix: Icon(Icons.lock, color: Theme.of(context).primaryColor)),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Paswırd must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Register here",
                              style: TextStyle(decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(context, RegisterPage());
                                })
                        ]),
                  ),
                ],
              )),
        )));
  }

  login() {}
}
