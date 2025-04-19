import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/loading_indicator.dart';

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLoadingIndicator(),
      ),
    );
  }
}