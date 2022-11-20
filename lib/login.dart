import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/main.dart';
import 'package:lottie/lottie.dart';
import 'map.dart';

class loginValidate extends StatefulWidget {
  const loginValidate({Key? key}) : super(key: key);

  @override
  State<loginValidate> createState() => _loginValidateState();
}

class _loginValidateState extends State<loginValidate> {
  bool _isObscure = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: Lottie.asset('assets/lottiefile.json',width: 210,height: 200,fit: BoxFit.fill),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ユーザー名が入力されていません!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'ユーザー名を入力してください',
                      //border: OutlineInputBorder(),
                      icon: Icon(Icons.person_sharp),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'パスワードが入力されていません!';
                      }
                      return null;
                    },
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'パスワード',
                      //border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Map()));
                        }
                      },
                      child: Text('ログイン')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
