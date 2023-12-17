import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/user_activities/login/login_functions.dart';

GlobalKey<FormState> loginFormKey = GlobalKey();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginScreen createState() => LoginScreen();
}

class LoginScreen extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String get username => _username.text;
  String get password => _password.text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kPurpleColor, kPrimaryColor],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Form(
                key: loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/tslogo.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: HeadingText(
                              text: 'Tejas\nSchools',
                            ),
                          ),
                        ],
                      ),
                      const Image(
                          image:
                              AssetImage('assets/images/welcome_graphics.jpg')),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _username,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  checkFormValidityToProceed(
                                      context, username, password);
                                },
                                child: const Text('Login'),
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
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
