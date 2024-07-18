// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sda_explorers_app/presentation/theme/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Center(
            child: Neumorphic(
              child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 400,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.convex,
                              boxShape: NeumorphicBoxShape.circle()),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: 50,
                                  height: 50,
                                )),
                          ),
                        ),
                        SizedBox(height: 20),
                        Neumorphic(
                          style: NeumorphicStyle(
                              depth: -2,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(30))),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 15, top: 15, right: 15)),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.convex,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(30.0))),
                          child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0)),
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
                                    style: kbutton,
                                  ))),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
