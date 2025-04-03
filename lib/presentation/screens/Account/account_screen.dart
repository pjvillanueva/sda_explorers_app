import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.blue.shade100,
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue,
                                backgroundImage:
                                    AssetImage('assets/images/paul.jpg'),
                              )),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.user?.fullName ?? 'Unknown',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Software Developer',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoCard(
                      context, 'Email', '${state.user?.email}', Icons.email),
                  _buildInfoCard(context, 'Phone', '${state.user?.phoneNumber}',
                      Icons.phone),
                  const SizedBox(height: 5),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const DarkModePreference(),
                  const SizedBox(height: 5),
                  const LanguagePreference(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(
      BuildContext context, String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 13)),
      ),
    );
  }
}

class DarkModePreference extends StatefulWidget {
  const DarkModePreference({super.key});

  @override
  State<DarkModePreference> createState() => _DarkModePreferenceState();
}

class _DarkModePreferenceState extends State<DarkModePreference> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.blueAccent),
        title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        trailing: Switch(
          value: isDarkMode,
          onChanged: (value) {
            setState(() {
              isDarkMode = value;
            });
          },
        ),
      ),
    );
  }
}

class LanguagePreference extends StatefulWidget {
  const LanguagePreference({super.key});

  @override
  State<LanguagePreference> createState() => _LanguagePreferenceState();
}

class _LanguagePreferenceState extends State<LanguagePreference> {
  String? selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        leading: const Icon(Icons.language, color: Colors.blueAccent),
        title: const Text('Language',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        trailing: DropdownButton<String>(
          value: selectedLanguage,
          items: <String>['English', 'Tagalog'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue;
            });
          },
        ),
      ),
    );
  }
}
