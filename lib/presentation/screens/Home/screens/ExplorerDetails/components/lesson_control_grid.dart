import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/presentation/screens/Home/screens/ExplorerDetails/cubits/explorer_detail_cubit.dart';

enum LessonControlState { available, answered, locked }

class LessonControlGrid extends StatelessWidget {
  const LessonControlGrid({super.key, required this.explorerId});

  final String explorerId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorerDetailCubit, ExplorerDetailState>(
      builder: (context, state) {
        return SizedBox(
          height: 270,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 24,
            itemBuilder: (context, index) {
              final number = index + 1;
              final isAvailable =
                  state.lessonControls[number] == LessonControlState.available;
              return LessonControlBox(explorerId: explorerId, number: number, isAvailable: isAvailable);
            },
          ),
        );
      },
    );
  }
}

class LessonControlBox extends StatefulWidget {
  const LessonControlBox(
      {super.key,
      required this.explorerId,
      required this.number,
      required this.isAvailable});

  final String explorerId;
  final int number;
  final bool isAvailable;

  @override
  State<LessonControlBox> createState() => _LessonControlBoxState();
}

class _LessonControlBoxState extends State<LessonControlBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ExplorerDetailCubit>().updateLessonControl(
            context,
            widget.explorerId,
            widget.number,
            widget.isAvailable
                ? LessonControlState.locked
                : LessonControlState.available);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isAvailable ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
        alignment: Alignment.center,
        child: Text(
          '${widget.number}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
