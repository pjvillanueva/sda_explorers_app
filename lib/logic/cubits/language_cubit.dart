//Possible language:
//english, filipino
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:flutter/material.dart';

class LanguageState {
  final String language;
  LanguageState({required this.language});

  Map<String, dynamic> toJson() => {'language': language};

  LanguageState.fromJson(Map<String, dynamic> json)
      : language = json['language'] ?? 'english';

  @override
  String toString() => 'language: $language';

  Locale get locale {
    switch (language.toLowerCase()) {
      case 'filipino':
        return const Locale('fil');
      case 'english':
      default:
        return const Locale('en');
    }
  }
}

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageState(language: 'english')) {
    hydrate();
  }

  void setLanguage(String language) {
    emit(LanguageState(language: language));
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    return state.toJson();
  }
}
