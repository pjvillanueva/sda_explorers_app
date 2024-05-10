import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/theme/app_colors.dart';

class NeumorphismPage extends StatefulWidget {
  const NeumorphismPage({Key? key}) : super(key: key);

  @override
  State<NeumorphismPage> createState() => _NeumorphismPageState();
}

class _NeumorphismPageState extends State<NeumorphismPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LIGHT_BACKGROUND_COLOR,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 30.0,
                  offset: Offset(-28, -28),
                  color: Colors.white,
                ),
                BoxShadow(
                    blurRadius: 30.0,
                    offset: Offset(20, 28),
                    color: Color(0xFFA7A9AF))
              ]),
          child: const SizedBox(
            height: 200,
            width: 200,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
