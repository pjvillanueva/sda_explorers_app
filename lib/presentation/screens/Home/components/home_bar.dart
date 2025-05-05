import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sda_explorers_app/logic/services/helpers.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/avatar.dart';

// ignore: must_be_immutable
class HomeBar extends StatelessWidget {
  HomeBar({super.key, required this.scaffoldKey});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AppAvatar(
                      size: 54.0,
                      innerColor: colorFromHex(state.user?.backgroundColor),
                      avatar: state.user?.avatar ?? 'sheep',
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _getGreetingText(context),
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                        Text(state.user?.fullName ?? 'Guest Explorer',
                            style: GoogleFonts.roboto(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // GestureDetector(
            //   child: Container(
            //     padding: const EdgeInsets.all(10.0),
            //     decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(Radius.circular(40.0)),
            //         color: Colors.blue),
            //     child: Row(children: [
            //       const GoldCoin(size: 30),
            //       const SizedBox(width: 5),
            //       Text('12000',
            //           style: GoogleFonts.roboto(fontSize: 18, color: Colors.white))
            //     ]),
            //   ),
            //   onTap: () {
            //     print('Tapped: ${scaffoldKey.currentState}');
            //     if (scaffoldKey.currentState?.isDrawerOpen == false) {
            //       scaffoldKey.currentState?.openEndDrawer();
            //     } else {
            //       scaffoldKey.currentState?.closeEndDrawer();
            //     }
            //   },
            // )
          ],
        );
      },
    );
  }
}

class GoldCoin extends StatelessWidget {
  const GoldCoin({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logos/gold_coin.png', height: size, width: size);
  }
}

String _getGreetingText(BuildContext context) {
  final hour = DateTime.now().hour;
  if (DateTime.now().weekday == DateTime.friday && hour >= 18 ||
      DateTime.now().weekday == DateTime.saturday && hour < 18) {
    return AppLocalizations.of(context)?.greetingsSabbath ?? '';
  }

  if (hour < 12) {
    return AppLocalizations.of(context)?.greetingsMorning ?? '';
  } else if (hour < 18) {
    return AppLocalizations.of(context)?.greetingsNoon ?? '';
  } else {
    return AppLocalizations.of(context)?.greetingsEvening ?? '';
  }
}
