import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/user_service.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/app_drawer.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/todays_verse_card.dart';
import 'package:sda_explorers_app/presentation/screens/Account/account_screen.dart';
import 'package:sda_explorers_app/presentation/screens/Home/home_service.dart';
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
    verifyUser(context);
    super.initState();
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

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                  _selectedIndex == 0
                      ? Icons.handyman
                      : Icons.handyman_outlined,
                  size: _selectedIndex == 0 ? 30 : null,
                ),
                label: 'Tools',
              ),
              BottomNavigationBarItem(
                icon: getMainIcon(_selectedIndex == 1, state.role.roleName),
                label: getMainLabel(state.role.roleName),
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
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final lessons = _getLangLessson(context);

    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBar(scaffoldKey: scaffoldKey),
              const SizedBox(height: 20),
              const TodaysVerseCard(),
              const SizedBox(height: 20),

              //Show this if the user is a guest or explorer
              Visibility(
                  visible: state.role.roleName == 'Guest' ||
                      state.role.roleName == 'Explorer',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                  )),
              //Show this if the user is a guide
              Visibility(
                visible: state.role.roleName == 'Guide',
                maintainState: true,
                child: FutureBuilder<List<Explorer>>(
                  future: state.role.roleName == 'Guide'
                      ? fetchMyExplorers()
                      : Future.value([]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No students found.'));
                    } else {
                      final students = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.homeMyStudents,
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
                            itemCount: students.length,
                            itemBuilder: (context, index) {
                              // return LessonListTile(
                              //   index: index,
                              //   content: students[index],
                              // );
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
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

getMainIcon(bool isSelected, String roleName) {
  switch (roleName) {
    case 'Owner':
      return Icon(
        isSelected ? Icons.dashboard : Icons.dashboard_outlined,
        size: isSelected ? 30 : 24,
      );
    case 'Admin':
      return Icon(
        isSelected ? Icons.dashboard : Icons.dashboard_outlined,
        size: isSelected ? 30 : 24,
      );
    case 'Guide':
      return Icon(
        isSelected ? Icons.history_edu : Icons.history_edu_outlined,
        size: isSelected ? 30 : 24,
      );
    case 'Explorer':
      return Icon(
        isSelected ? Icons.explore : Icons.explore_outlined,
        size: isSelected ? 30 : 24,
      );
    case 'Guest':
      return Icon(
        isSelected ? Icons.explore : Icons.explore_outlined,
        size: isSelected ? 30 : 24,
      );
    default:
      return Icon(
        isSelected ? Icons.explore : Icons.explore_outlined,
        size: isSelected ? 30 : 24,
      );
  }
}

getMainLabel(String roleName) {
  switch (roleName) {
    case 'Owner':
      return 'Manage';
    case 'Admin':
      return 'Admin';
    case 'Guide':
      return 'Guide';
    case 'Explorer':
      return 'Explore';
    case 'Guest':
      return 'Explore';
    default:
      return 'Explore';
  }
}
