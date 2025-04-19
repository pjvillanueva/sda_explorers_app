// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/test_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Test/widgets/page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestProgressIndicator extends StatefulWidget {
  const TestProgressIndicator(
      {super.key, required this.currentStep, required this.numberOfQuestions});

  final int currentStep;
  final int numberOfQuestions;

  @override
  _TestProgressIndicatorState createState() => _TestProgressIndicatorState();
}

class _TestProgressIndicatorState extends State<TestProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant TestProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentStep != oldWidget.currentStep) {
      _controller.animateTo(widget.currentStep / widget.numberOfQuestions);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return CircularProgressIndicator(
                            strokeWidth: 5.0,
                            value: _progressAnimation.value,
                            backgroundColor: Colors.orange[50],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.orange),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return Text(
                            '${(_progressAnimation.value * 100).toInt()}%',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.generalQuestion} ${widget.currentStep + 1}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ${AppLocalizations.of(context)!.generalOf} ${widget.numberOfQuestions}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PageIndicator(
                  currentStep: widget.currentStep,
                  numberOfQuestions: widget.numberOfQuestions)
            ],
          ),
        );
      },
    );
  }
}