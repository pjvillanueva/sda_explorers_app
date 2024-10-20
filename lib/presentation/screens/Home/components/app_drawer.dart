// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';
import 'package:sda_explorers_app/presentation/screens/Bible/bible_screen.dart';
import 'package:sda_explorers_app/presentation/screens/Profile/profile_screen.dart';
import 'package:sda_explorers_app/presentation/screens/input_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return SizedBox(
                    height: 250,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue.shade800),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      currentAccountPicture:
                          Image.asset('assets/logos/explorers_logo_nbg.png'),
                      currentAccountPictureSize: const Size(90.0, 90.0),
                      accountName: Text(state.user?.fullName ?? 'Unknown',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                      accountEmail: Text(state.user?.email ?? '',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                    ));
              },
            ),
            Column(
              children: [
                ListTile(
                    leading: Icon(Icons.home_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Home'),
                    onTap: () => Navigator.of(context).pop()),
                ListTile(
                    leading: Icon(Icons.book_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Bible'),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BibleScreen(),
                        ))),
                ListTile(
                    leading: Icon(Icons.church_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Church'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.input,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Input'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const InputPage(),
                      ));
                    }),
                ListTile(
                    leading: Icon(Icons.monetization_on_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Donate'),
                    onTap: () {}),
                const Divider(),
                BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                  return ListTile(
                    leading: Icon(
                        state.themeMode == ThemeMode.dark
                            ? Icons.wb_sunny_outlined
                            : Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: Text(state.themeMode == ThemeMode.dark
                        ? 'Light Theme'
                        : 'Dark Theme'),
                    onTap: () =>
                        BlocProvider.of<ThemeCubit>(context).toggleTheme(),
                  );
                }),
                ListTile(
                    leading: Icon(Icons.person_outline,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Profile'),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()))),
                ListTile(
                    leading: Icon(Icons.logout_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Logout'),
                    onTap: () async {
                      try {
                        StorageManager().deleteData('user_id');
                        context.read<UserCubit>().clearUser();
                        await FirebaseAuth.instance.signOut();
                      } catch (e) {
                        print('Error signing out');
                      }
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
