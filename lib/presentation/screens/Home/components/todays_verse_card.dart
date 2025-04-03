import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/utils/constants.dart';

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
          Text('Today\'s verse',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey.shade600,
              )),
          const SizedBox(height: 10),
          Text(
            'For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.',
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
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              //   decoration: const BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(40.0)),
              //       color: Colors.white),
              //   child: Row(children: [
              //     const GoldCoin(size: 25),
              //     const SizedBox(width: 5),
              //     Text('120',
              //         style:
              //             GoogleFonts.roboto(fontSize: 18, color: Colors.black))
              //   ]),
              // ),
              const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.auto_stories_outlined,
                      color: darkTextColor, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    'John 3:16',
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
