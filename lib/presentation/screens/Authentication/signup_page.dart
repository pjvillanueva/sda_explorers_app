// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/lessons/helpers.dart';
import 'package:sda_explorers_app/data/models/user_roles.dart';
import 'package:sda_explorers_app/logic/services/helpers.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';
import 'package:sda_explorers_app/presentation/screens/Authentication/login_page.dart';
import 'package:sda_explorers_app/presentation/screens/Home/home_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var isPasswordVisible = false;
  var isConfirmPasswordVisible = false;
  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                'Create an account to get started',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      const SizedBox(height: 15.0),
                      _buildTextField(
                        controller: firstController,
                        icon: Icons.person_outline,
                        label: 'First Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      _buildTextField(
                        controller: lastController,
                        icon: Icons.person_outline,
                        label: 'Last Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      _buildTextField(
                        controller: emailController,
                        icon: Icons.email_outlined,
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      _buildTextField(
                        controller: phoneController,
                        icon: Icons.phone_outlined,
                        label: 'Phone Number',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\+?[\d\s-]{10,14}$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      _buildPasswordField(
                        controller: passwordController,
                        label: 'Password',
                        isVisible: isPasswordVisible,
                        onVisibilityChanged: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      _buildPasswordField(
                        controller: confirmPasswordController,
                        label: 'Confirm Password',
                        isVisible: isConfirmPasswordVisible,
                        onVisibilityChanged: () {
                          setState(() {
                            isConfirmPasswordVisible =
                                !isConfirmPasswordVisible;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: 500.0,
                        height: 45.0,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                final auth = FirebaseAuth.instance;
                                final firestore = FirebaseFirestore.instance;

                                String userRoleId = generateUUID();
                                String explorerId = generateUUID();

                                UserCredential userCredential =
                                    await auth.createUserWithEmailAndPassword(
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim());

                                // Save user
                                await firestore
                                    .collection('users')
                                    .doc(userCredential.user!.uid)
                                    .set({
                                  'id': userCredential.user!.uid,
                                  'firstName': firstController.text.trim(),
                                  'lastName': lastController.text.trim(),
                                  'phoneNumber': phoneController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'imageUrl': "",
                                  'avatar': getRandomAvatarName(),
                                  'backgroundColor': colorToHex(generateAvatarColor()),
                                  'expPoints': 0,
                                  'createdAt': FieldValue.serverTimestamp(),
                                });

                                //Save user role
                                await firestore
                                    .collection('userRoles')
                                    .doc(userRoleId)
                                    .set({
                                  'id': userRoleId,
                                  'userId': userCredential.user!.uid,
                                  'roleId': EXPLORER_ROLE_ID,
                                });

                                //Save explorer object
                                await firestore
                                    .collection('explorers')
                                    .doc(explorerId)
                                    .set({
                                  'id': explorerId,
                                  'userId': userCredential.user!.uid,
                                  'allowedLessons':
                                      List.generate(24, (i) => '${i + 1}'),
                                  'lessonAnswers': [],
                                  'isGraduated': false,
                                });

                                Future.microtask(() {
                                  if (context.mounted) {
                                    AppSnackBar.show(context,
                                        message: 'Sign up successful',
                                        type: SBMessageType.success);
                                  }
                                });

                                Navigator.pop(context);
                              }
                            } on FirebaseAuthException catch (e) {
                              Future.microtask(() {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      message: 'Sign up failed',
                                      error: e.toString(),
                                      type: SBMessageType.error);
                                }
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add_outlined,
                                  color: Colors.white),
                              SizedBox(width: 10.0),
                              Text('SIGN UP',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
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
                      // const SizedBox(height: 30.0),
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
                      //           const Text('Sign up with Google',
                      //               style: TextStyle(color: Colors.black)),
                      //         ],
                      //       ),
                      //     )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          ),
                        ],
                      )
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

  Widget _buildTextField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityChanged,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outlined,
            color: Theme.of(context).colorScheme.secondary),
        suffixIcon: GestureDetector(
          onTap: onVisibilityChanged,
          child: Icon(
            isVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
        ),
      ),
      obscureText: !isVisible,
      cursorColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
