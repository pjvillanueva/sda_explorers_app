import 'package:flutter/material.dart';

class GreetingsBox extends StatelessWidget {
  const GreetingsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getAssetImageBasedOnTimeOfDay()),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
            colors: [Colors.blue[400]!, Colors.blue[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getGreeting(),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ]),
          ),
          const SizedBox(height: 10),
          Text(
            'Ready to embark on your Bible quiz journey?',
            style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

String getAssetImageBasedOnTimeOfDay() {
  DateTime now = DateTime.now();

  if (now.hour >= 6 && now.hour < 10) {
    return 'assets/images/morning_bg.jpg';
  } else if (now.hour >= 10 && now.hour < 16) {
    return 'assets/images/noon_bg.jpg';
  } else if (now.hour >= 16 && now.hour < 20) {
    return 'assets/images/sunset_bg.jpg';
  } else {
    return 'assets/images/evening_bg.jpg';
  }
}

String getGreeting() {
  DateTime now = DateTime.now();

  if (now.weekday == DateTime.saturday) {
    return 'Happy Sabbath, Explorer!';
  }
  return 'Welcome, Explorer!';
}
