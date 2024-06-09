import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPageState {
  InputPageState({required this.lessonContents, required this.rawContents});

  final Map<String, String> lessonContents;
  final List<String> rawContents;

  InputPageState copyWith({
    Map<String, String>? lessonContents,
    List<String>? rawContents,
  }) {
    return InputPageState(
      lessonContents: lessonContents ?? this.lessonContents,
      rawContents: rawContents ?? this.rawContents,
    );
  }
}

class InputPageCubit extends Cubit<InputPageState> {
  InputPageCubit() : super(InputPageState(lessonContents: {}, rawContents: []));

  void addContent(String key, String text) {
    var lessonContents = state.lessonContents;
    lessonContents["'$key'"] = processContents(text);
    emit(state.copyWith(lessonContents: lessonContents));
  }

  void copyContents(int lessonNumber) {
    var contents =
        'const Lesson${lessonNumber}ContentsMap = ${state.lessonContents.toString()};';
    Clipboard.setData(ClipboardData(text: contents));
  }

  void addRawContents(String source) {
    List<String> _rawContents = [];
    print(source);
  }
}

String processContents(String text) {
  var result = "'${text.trim().replaceAll("'", r"\'")}'";
  result = cleanParagraph(result);
  return result;
}

String cleanParagraph(String text) {
  String cleaned = text.replaceAll('\n', ' ');
  cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ');
  return cleaned.trim();
}
