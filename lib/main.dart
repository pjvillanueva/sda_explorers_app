import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sda_explorers_app/logic/app_bloc_providers.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Home/home_screen.dart';
import 'package:sda_explorers_app/presentation/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Explorers App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: child,
          );
        },
        child: HomeScreen());
  }
}


//Tagalo Bible Version - Ang Biblia (1905)
