import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/richtext.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late MediaQueryData mediaQueryData;
  final _emailpassKey = GlobalKey<FormState>();
  bool _passwordObscure1 = true;
  bool _passwordObscure2 = true;
  bool _passswordMatchLabel = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Center(
        child: Hero(
          tag: 'log',
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: mediaQueryData.size.width > 480
                  ? 400
                  : mediaQueryData.size.width <= 315
                      ? 315
                      : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff1f4894),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(width: 40, 'assets/images/facebook.png'),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Continue with Facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        padding: EdgeInsets.zero),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(width: 30, 'assets/images/google.png'),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Continue with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Form(
                      key: _emailpassKey,
                      child: Container(
                        width: mediaQueryData.size.width - 80,
                        child: Column(children: [
                          TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(hintText: 'Username'),
                            validator: (value) {
                              return value!.length >= 3
                                  ? null
                                  : 'Username must be more that 2 characters';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(hintText: 'Email'),
                            validator: (value) {
                              bool regex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              return regex ? null : 'The email is incorrect!!';
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onTap: () {
                              _passswordMatchLabel = false;
                              setState(() {});
                            },
                            controller: _passwordController1,
                            obscureText: _passwordObscure1,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordObscure1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordObscure1 = !_passwordObscure1;
                                    });
                                  },
                                )),
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'The password length must be 8 or more';
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onTap: () {
                              _passswordMatchLabel = false;
                              setState(() {});
                            },
                            controller: _passwordController2,
                            obscureText: _passwordObscure2,
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordObscure2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordObscure2 = !_passwordObscure2;
                                    });
                                  },
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Visibility(
                                visible: _passswordMatchLabel,
                                child: Text(
                                  'Password don\'t match!!',
                                  style: TextStyle(color: Colors.red),
                                )),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_emailpassKey.currentState!.validate()) {
                                  if (_passwordController1.text ==
                                      _passwordController2.text) {
                                    _passwordController1.text = '';
                                    _passwordController2.text = '';
                                    _userNameController.text = '';
                                    _emailController.text = '';
                                  } else {
                                    _passswordMatchLabel = true;
                                    setState(() {});
                                  }
                                }
                              },
                              child: Container(
                                  height: 40,
                                  width: mediaQueryData.size.width - 80,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 16),
                                  ))),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'You have an account? ',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                  children: [
                                MouseRegionSpan(
                                    mouseCursor: SystemMouseCursors.click,
                                    inlineSpan: TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, '/signin');
                                          },
                                        text: 'Sign In',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)))
                              ]))
                        ]),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
