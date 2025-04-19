import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sda_explorers_app/firebase_options.dart';
import 'package:sda_explorers_app/logic/app_bloc_providers.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/logic/services/user_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/loading_screen.dart';
import 'package:sda_explorers_app/presentation/screens/Home/home_screen.dart';
import 'presentation/screens/Authentication/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppBlocProviders(child: SDAExplorersApp());
  }
}

class SDAExplorersApp extends StatelessWidget {
  const SDAExplorersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode =
        context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode);

    return ScreenUtilInit(
      designSize: const Size(412, 820),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Explorers App',
                  theme: themeState.themeData,
                  themeMode: themeMode,
                  locale: languageState.locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', ''),
                    Locale('fil', ''),
                  ],
                  home: child,
                );
              },
            );
          },
        );
      },
      child: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is signed in – now verify
            return FutureBuilder(
              future: verifyUser(context),
              builder: (context, verifySnapshot) {
                if (verifySnapshot.connectionState == ConnectionState.waiting) {
                  return const AppLoadingScreen();
                }
                return const HomeScreen();
              },
            );
          }
          return const LoginPage();
        });
  }
}

//Tagalog Bible Version - Ang Biblia (1905)
//Ui theme reference: https://dribbble.com/shots/22868289-KwikQuiz-App-UI-Gamification


//MVP REQUIREMENTS
//Formatting question text
//Submit Test
//Check Test
//Verse for the day
//Donate page
//Add ads
//Apply as teacher
//Register/assign student
//Find Teacher 
//Images


//ROLES
//GUEST - default role, can read and answer lessons (but no one to check them)
//STUDENT - can read and answer lessons, can apply as a student of a teacher, can apply as a teacher once lessons are completed
//TEACHER - must completed lessons, must donated, must be approved by admin or owner to be a teacher, can assign students, can check students answers, can approve students and invite students
//ADMIN - can approve teachers, can approve students, can assign teachers, can assign students, can check students answers, can check teachers answers, can check donations, can check ads, can receive reports, can check all users
//OWNER - can approve teachers, can approve students, can assign teachers, can assign students, can check students answers, can check teachers answers, can check donations, can check ads, can receive reports, can check all users, can delete users, can delete ads, can delete donations, can delete reports, can delete lessons



//GUEST ROLES
//May able to see and read the lessons, may access tools, may access account

