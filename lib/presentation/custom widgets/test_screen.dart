import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
            child: ListView(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
              child: Column(children: [
                Container(
                    height: 120.0,
                    child: Center(
                        child:
                            Image.asset('assets/logo/logo.png', height: 80.0)))
              ]))
        ])));
  }
}
