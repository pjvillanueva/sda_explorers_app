// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';
import 'package:sda_explorers_app/presentation/screens/Authentication/password_recovery_page.dart';
import 'package:sda_explorers_app/presentation/screens/Authentication/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var isPasswordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: 500.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Login',
                                  style: TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                              Text('Sign in to continue',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface))
                            ]),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Theme.of(context).colorScheme.secondary),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0))),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: passwordController,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outlined,
                            color: Theme.of(context).colorScheme.secondary),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0))),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: !isPasswordVisible,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('Forgot Password?',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordRecoveryPage()));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                        width: 500.0,
                        height: 45.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Theme.of(context).colorScheme.secondary)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login_outlined, color: Colors.white),
                                SizedBox(width: 10.0),
                                Text('LOGIN',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  UserCredential userCredential =
                                      await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                  //Save the UID to local storage
                                  StorageManager().saveData(
                                      'user_id', userCredential.user!.uid);
                                } on FirebaseAuthException catch (e) {
                                  print(e);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Login failed')),
                                  );
                                }
                              }
                            })),
                    const SizedBox(height: 10.0),
                    SizedBox(
                        width: 500.0,
                        height: 45.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Colors.grey.shade700)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person_outline_outlined,
                                    color: Colors.white),
                                SizedBox(width: 10.0),
                                Text('CONTINUE AS GUEST',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance.signInAnonymously();
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Failed to sign in as guest: $e')),
                                );
                              }
                            })),
                    // const SizedBox(height: 50.0),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //         width: 100.0, child: Divider(color: Colors.grey)),
                    //     SizedBox(width: 10.0),
                    //     Text('OR', style: TextStyle(color: Colors.grey)),
                    //     SizedBox(width: 10.0),
                    //     SizedBox(
                    //         width: 100.0, child: Divider(color: Colors.grey)),
                    //   ],
                    // ),
                    // const SizedBox(height: 50.0),
                    // SizedBox(
                    //     width: 500.0,
                    //     height: 45.0,
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ButtonStyle(
                    //           backgroundColor:
                    //               WidgetStateProperty.all(Colors.white)),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Image.asset('assets/images/google_logo.png',
                    //               width: 25.0, height: 25.0),
                    //           const SizedBox(width: 10.0),
                    //           const Text('Sign in with Google',
                    //               style: TextStyle(color: Colors.black)),
                    //         ],
                    //       ),
                    //     )),
                    const SizedBox(height: 50.0),
                    TextButton(
                      child: Text('Create an account',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
