import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/test_cubit.dart';

class QuestionActions extends StatelessWidget {
  const QuestionActions({super.key, this.back, this.submit});

  final Function()? submit;
  final Function()? back;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
                visible: state.currentQuestion > 0,
                child: Expanded(
                    child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.grey)),
                  onPressed: (){
                    if(back == null){
                      context.read<TestCubit>().back();
                    } else {
                      back;
                    } 
                  },
                  child:
                      const Text('Back', style: TextStyle(color: Colors.black)),
                ))),
            Visibility(
                visible: state.currentQuestion <= state.totalQuestions - 1,
                child: Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue),
                        ),
                        onPressed: submit,
                        child: Text(
                          state.currentQuestion == state.totalQuestions - 1
                              ? 'Submit'
                              : 'Next',
                          style: const TextStyle(color: Colors.white),
                        )))),
          ],
        );
      },
    );
  }
}
