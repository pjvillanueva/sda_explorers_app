import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/data/daily_verses/daily_verse_2025_en.dart';
import 'package:sda_explorers_app/data/daily_verses/daily_verse_2025_fil.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodaysVerseCard extends StatelessWidget {
  const TodaysVerseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.homeTodaysVerse,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey.shade600,
              )),
          const SizedBox(height: 10),
          Text(
            cleanupVerse(getTodayVerse(context)),
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: darkTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: Colors.white),
                child: Row(children: [
                  const GoldCoin(size: 25),
                  const SizedBox(width: 5),
                  Text('120',
                      style:
                          GoogleFonts.roboto(fontSize: 18, color: Colors.black))
                ]),
              ),
              const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.auto_stories_outlined,
                      color: darkTextColor, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    getChapterAndVerse(getTodayVerse(context)),
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      color: darkTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String getChapterAndVerse(String verse) {
  final regex = RegExp(r'\(([^)]+)\)');
  final match = regex.firstMatch(verse);
  return match?.group(1) ?? '';
}


String getTodayVerse(BuildContext context) {
  final now = DateTime.now();
  final month = now.month.toString();
  final day = now.day.toString();
  final year = now.year.toString().substring(2, 4);

  var todayCode = '$month/$day/$year';

  const defaultVerseEn =
      'For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life. (John 3:16)';
  const defaultVerseFil =
      'Sapagka’t gayon na lamang ang pag-ibig ng Diyos sa sanglibutan, na ibinigay niya ang kanyang bugtong na Anak, upang ang sinomang sumampalataya sa kanya ay huwag mapahamak, kundi magkaroon ng buhay na walang hanggan. (Juan 3:16)';

  String verse = '';
  if (context.read<LanguageCubit>().state.locale.languageCode == 'en') {
    verse = dailyVerse2025Eng[todayCode] ?? defaultVerseEn;
  } else if (context.read<LanguageCubit>().state.locale.languageCode == 'fil') {
    verse = dailyVerse2025Fil[todayCode] ?? defaultVerseFil;
  } else {
    verse = defaultVerseEn;
  }
  return verse;
}

cleanupVerse(String verse) {
  final regex = RegExp(r'\(.*\)');
  return verse.replaceAll(regex, '').trim();
}

