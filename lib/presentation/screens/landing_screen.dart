import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/border_box.dart';
import 'package:sda_explorers_app/presentation/theme/app_colors.dart';
import 'package:sda_explorers_app/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        )),
                    BorderBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ))
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  'Hello',
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Text(
                  'Good Morning, User!',
                  style: themeData.textTheme.headline1,
                ),
              ),
              const Padding(
                padding: sidePadding,
                child: Divider(height: padding, color: COLOR_GREY),
              )
            ],
          ),
        ),
      ),
    );
  }
}
