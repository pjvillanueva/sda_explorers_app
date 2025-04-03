import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/utils/constants.dart';

// ignore: must_be_immutable
class HomeBar extends StatelessWidget {
  HomeBar({super.key, required this.scaffoldKey});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue.shade100,
                      child: const CircleAvatar(
                          radius: 22, backgroundColor: Colors.blue, 
                          backgroundImage: AssetImage('assets/images/paul.jpg'),
                          )),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Good Afternoon!',
                      style: GoogleFonts.roboto(
                          fontSize: 14, color: Colors.grey.shade700),
                    ),
                    Text('Paul James Villanueva',
                        style: GoogleFonts.roboto(
                            fontSize: 17,
                            color: darkTextColor,
                            fontWeight: FontWeight.bold)),
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
