import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';
import 'package:sda_explorers_app/logic/services/user_service.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/app_drawer.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/lesson_carousel.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/todays_verse_card.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_list_tile.dart';
import 'package:sda_explorers_app/utils/constants.dart';

// Additional Screens as placeholders
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messages Screen"));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings Screen"));
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notifications Screen"));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
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
    final List<Widget> pages = [
      HomeContent(scaffoldKey: scaffoldKey),
      const ProfileScreen(),
      const MessagesScreen(),
      const SettingsScreen(),
      const NotificationsScreen(),
    ];

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const AppDrawer(),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// Separate widget for the main home content
class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
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
            'Lessons',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 15),
          ListView.builder(
            // Add a height constraint using SizedBox
            shrinkWrap: true, // Makes the ListView fit its content
            physics:
                const NeverScrollableScrollPhysics(), // Prevents nested scrolling
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return LessonListTile(
                index: index,
                content: lessons[index],
              );
            },
          ),
          // LessonCarousel(),
        ],
      ),
    );
  }
}
