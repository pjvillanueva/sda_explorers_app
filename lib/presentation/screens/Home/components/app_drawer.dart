// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
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
            SizedBox(
                height: 250,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue.shade800),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  currentAccountPicture:
                      Image.asset('assets/logos/explorers_logo_nbg.png'),
                  currentAccountPictureSize: const Size(90.0, 90.0),
                  accountName: Text('Paul James Villanueva',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  accountEmail: Text('pjvillanueva819@gmail.com',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                )),
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
                    onTap: () {}),
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
                  bool isDark = state.themeMode == ThemeMode.dark;
                  return ListTile(
                    leading: Icon(
                        isDark
                            ? Icons.wb_sunny_outlined
                            : Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: Text(isDark ? 'Light Theme' : 'Dark Theme'),
                    onTap: () {
                      BlocProvider.of<ThemeCubit>(context).setTheme(!isDark);
                    },
                  );
                }),
                ListTile(
                    leading: Icon(Icons.person_outline,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Profile'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.logout_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    title: const Text('Logout'),
                    onTap: () async {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
