import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sda_explorers_app/presentation/screens/home_screen.dart';
import 'package:sda_explorers_app/presentation/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 820),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Explorers App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            home: child,
          );
        },
        child: HomeScreen());
  }
}


//Create an easier way to label the lesson paragraphs

//Create a page with configurations:
/* 
  Configurations needed:
    - Lesson Number
    - Text Type
       - Title = T
       - Memory Verse = M
       - Paragraph = P
       - Subtitle = S
       - Question = Q
       - Bible Verse = B
       - Index = I
    - Place in Sequence
    - Text Box to edit


- EXPECTED RESULTS:
- A MAP
*/


//TODO:
//1. Fix the splash screen
//2. Create the texttype widgets
//3. Fix error in the lesson page