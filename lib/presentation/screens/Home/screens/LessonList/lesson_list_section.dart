import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_list_tile.dart';
import 'package:sda_explorers_app/utils/constants.dart';

class LessonListSection extends StatelessWidget {
  const LessonListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = _getLangLessson(context);
    final Explorer? explorer = getExplorerData(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.homeLessons,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lessonNumber = index + 1;
            final isAllowed =
                explorer?.allowedLessons.contains(lessonNumber.toString()) ?? false;
            return LessonListTile(
              index: index,
              content: lessons[index],
              isAllowed: isAllowed,
            );
          },
        ),
      ],
    );
  }
}

List<Map<String, String>> _getLangLessson(BuildContext context) {
  var lang = context.read<LanguageCubit>().state.locale.languageCode;

  if (lang == 'fil') {
    return FIL_LESSONS;
  } else {
    return EN_LESSONS;
  }
}

Explorer? getExplorerData(BuildContext context) {
  final state = context.read<UserCubit>().state;
  if (state.role?.roleName == 'Explorer') {
    return Explorer.fromJson(state.roleData);
  } else {
    return null;
  }
}
