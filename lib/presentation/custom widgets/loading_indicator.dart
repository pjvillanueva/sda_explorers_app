import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Center(
        child: Material(
          borderRadius: BorderRadius.circular(16),
          child: const SizedBox(
            width: 120,
            height: 120,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomLoadingIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

class CustomLoadingIndicator extends StatelessWidget {
  final Color color;

  const CustomLoadingIndicator({
    Key? key,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Image.asset('assets/logos/explorers_logo_nbg.png',
                width: 30, height: 30),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Loading...',
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
