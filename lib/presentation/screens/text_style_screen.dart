// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sda_explorers_app/presentation/theme/app_theme.dart';

class _FontDisplayObject {
  _FontDisplayObject(this.styleTitle, this.style);

  final String styleTitle;
  final TextStyle style;
}

const _sampleText = 'Hello World';

class TextFontScreen extends StatelessWidget {
  TextFontScreen({super.key});

  // final List<_FontDisplayObject> _fontdisplayObjects = [
  //   _FontDisplayObject('Display Large', kdisplayLarge),
  //   _FontDisplayObject('Display Medium', kdisplayMedium),
  //   _FontDisplayObject('Display Small', kdisplaySmall),
  //   _FontDisplayObject('Headline Large', kheadlineLarge),
  //   _FontDisplayObject('Headline Medium', kheadlineMedium),
  //   _FontDisplayObject('Headline Small', kheadlineSmall),
  //   _FontDisplayObject('Title Large', ktitleLarge),
  //   _FontDisplayObject('Title Medium', ktitleMedium),
  //   _FontDisplayObject('Title Small', ktitleSmall),
  //   _FontDisplayObject('Label Large', klabelLarge),
  //   _FontDisplayObject('Label Medium', klabelMedium),
  //   _FontDisplayObject('Label Small', klabelSmall),
  //   _FontDisplayObject('Body Large', kbodyLarge),
  //   _FontDisplayObject('Body Medium', kbodyMedium),
  //   _FontDisplayObject('Body Small', kbodySmall),
  //   _FontDisplayObject('Headline 1', kheadline1),
  //   _FontDisplayObject('Headline 2', kheadline2),
  //   _FontDisplayObject('Headline 3', kheadline3),
  //   _FontDisplayObject('Headline 4', kheadline4),
  //   _FontDisplayObject('Headline 5', kheadline5),
  //   _FontDisplayObject('Headline 6', kheadline6),
  //   _FontDisplayObject('Subtitle 1', ksubtitle1),
  //   _FontDisplayObject('Subtitle 2', ksubtitle2),
  //   _FontDisplayObject('Body 1', kbody1),
  //   _FontDisplayObject('Body 2', kbody2),
  //   _FontDisplayObject('Button', kbutton),
  //   _FontDisplayObject('Caption', kcaption),
  //   _FontDisplayObject('OverLine', koverline),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: kdisplayLarge.fontSize),
            // style: TextStyle(
            //     color: Colors.red,
            //     fontSize: 57.0,
            //     fontWeight: regular,
            //     height: 64.0.h,
            //     letterSpacing: 0.w),
          ),
        ),
      ),
      // child: Scaffold(
      //     body: ListView.builder(
      //         scrollDirection: Axis.vertical,
      //         itemCount: _fontdisplayObjects.length,
      //         itemBuilder: (context, index) {
      //           var item = _fontdisplayObjects[index];
      //           return fontDisplay(item.styleTitle, _sampleText, item.style);
      //         })),
    );
  }
}

Widget fontDisplay(String styleTitle, String sampleText, TextStyle style) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [Text(styleTitle), Text(sampleText, style: style)],
  );
}
