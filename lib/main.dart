import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sda_explorers_app/firebase_options.dart';
import 'package:sda_explorers_app/logic/app_bloc_providers.dart';
// import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Home/home_screen.dart';
import 'package:sda_explorers_app/presentation/theme/app_theme.dart';

import 'presentation/screens/Authentication/login_page.dart';

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
    // var themeMode =
    //     context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode);

    return ScreenUtilInit(
        designSize: const Size(412, 820),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Explorers App',
            theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            // themeMode: themeMode,
            home: child,
          );
        },
        child: const AuthWrapper());
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
            return const HomeScreen();
          }
          return const LoginPage();
        });
  }
}


//Tagalog Bible Version - Ang Biblia (1905)
//Ui theme reference: https://dribbble.com/shots/22868289-KwikQuiz-App-UI-Gamification


//BACKLOGS
//Finish putting text the explorers contents = 8/24
//Finish putting text the explorers questionaire = 1/24
//Make the verse for the day work
//Pointing system9
//Guide system
//Donate page
//Add ads
//User Roles
//User Profile
//User Pages for Admin