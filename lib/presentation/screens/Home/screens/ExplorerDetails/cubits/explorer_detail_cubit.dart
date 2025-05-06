import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/services/explorer_service.dart';
import 'package:sda_explorers_app/presentation/screens/Home/screens/ExplorerDetails/components/lesson_control_grid.dart';

class ExplorerDetailState {
  ExplorerDetailState({required this.lessonControls});
  final Map<int, LessonControlState> lessonControls;

  @override
  String toString() => 'ExplorerDetailState(lessonControls: $lessonControls)';
}

class ExplorerDetailCubit extends Cubit<ExplorerDetailState> {
  ExplorerDetailCubit()
      : super(ExplorerDetailState(lessonControls: const {}));

  void updateLessonControl(BuildContext context, String explorerId, int lessonNumber, LessonControlState lState) {
    final lessonControls = Map<int, LessonControlState>.from(state.lessonControls);
    lessonControls[lessonNumber] = lState;
    emit(ExplorerDetailState(lessonControls: lessonControls));

    updateExplorer(context, explorerId, {
      'allowedLessons': getAllowedLessons(),
    });

  }

  void initialLessonControl(List<String> allowedLessons) {
    final lessonControls = <int, LessonControlState>{};
    for (var i = 1; i <= 24; i++) {
      lessonControls[i] = allowedLessons.contains(i.toString())
          ? LessonControlState.available
          : LessonControlState.locked;
    }
    emit(ExplorerDetailState(lessonControls: lessonControls));
  }

  List<String> getAllowedLessons() {
    return state.lessonControls.entries
        .where((entry) => entry.value != LessonControlState.locked)
        .map((entry) => entry.key.toString())
        .toList();
  }
}