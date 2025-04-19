import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';
import 'package:sda_explorers_app/logic/services/user_service.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/app_drawer.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/todays_verse_card.dart';
import 'package:sda_explorers_app/presentation/screens/Account/account_screen.dart';
import 'package:sda_explorers_app/presentation/screens/Tools/tools_screen.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_list_tile.dart';
import 'package:sda_explorers_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    verifyUser();
    super.initState();
  }

  verifyUser() async {
    try {
      await getUser(context);
      var user = context.read<UserCubit>().state.user;
      if (user == null) {
        StorageManager().deleteData('user_id');
        await FirebaseAuth.instance.signOut();
      }
    } catch (e) {
      print(e);
      StorageManager().deleteData('user_id');
      await FirebaseAuth.instance.signOut();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode =
        context.select((ThemeCubit themeCubit) => themeCubit.state.isDarkMode);

    final List<Widget> pages = [
      const ToolsScreen(),
      HomeContent(scaffoldKey: scaffoldKey),
      const AccountScreen(),
    ];

    // Update system UI style based on theme
    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const AppDrawer(),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.handyman : Icons.handyman_outlined,
              size: _selectedIndex == 0 ? 30 : null,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.explore : Icons.explore_outlined,
              size: _selectedIndex == 1 ? 30 : null,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.account_box
                  : Icons.account_box_outlined,
              size: _selectedIndex == 2 ? 30 : null,
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final lessons = _getLangLessson(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeBar(scaffoldKey: scaffoldKey),
          const SizedBox(height: 20),
          const TodaysVerseCard(),
          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.homeLessons,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return LessonListTile(
                index: index,
                content: lessons[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> _getLangLessson(BuildContext context) {
  var lang = context.read<LanguageCubit>().state.locale.languageCode;

  if (lang == 'fil') {
    return FIL_LESSONS;
  } else {
    return EN_LESSONS;
  }
}
