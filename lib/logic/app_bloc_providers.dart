import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';

class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
    ], child: child);
  }
}
