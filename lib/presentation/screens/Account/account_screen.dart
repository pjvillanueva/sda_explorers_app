import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/user_roles.dart';
import 'package:sda_explorers_app/logic/cubits/language_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/theme_cubit.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sda_explorers_app/logic/services/helpers.dart';
import 'package:sda_explorers_app/logic/services/storage_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/avatar.dart';
import 'package:sda_explorers_app/presentation/screens/Account/components/avatar_picker_dialog.dart';
import 'package:sda_explorers_app/presentation/screens/Authentication/login_page.dart';
import 'package:sda_explorers_app/utils/constants.dart';

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
                        AppAvatar(
                          size: 100.0,
                          innerColor: colorFromHex(state.user?.backgroundColor),
                          avatar: state.user?.avatar ?? 'matthew',
                          showEditButton: true,
                          onEdit: () {
                            showAvatarPickerDialog(
                              context,
                              AVATAR_NAMES,
                            ).then((value) {
                              if (value != null) {
                                // Handle avatar selection
                                print('Selected avatar: $value');
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.user?.fullName ?? 'Guest Explorer',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.role.roleName,
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoCard(
                      context, 'Email', state.user?.email, Icons.email),
                  _buildInfoCard(
                      context,
                      AppLocalizations.of(context)!.generalPhone,
                      state.user?.phoneNumber,
                      Icons.phone),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.generalPreference,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const DarkModePreference(),
                  const SizedBox(height: 5),
                  const LanguagePreference(),
                  const SizedBox(height: 5),
                  LogoutButton(userRole: state.role),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard(
      BuildContext context, String title, String? value, IconData icon) {
    return Visibility(
      visible: value != null,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          subtitle: Text(value ?? '', style: const TextStyle(fontSize: 13)),
        ),
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: ListTile(
            leading: Icon(state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Colors.blueAccent),
            title: Text(state.isDarkMode ? 'Dark Mode' : 'Light Mode',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            trailing: Switch(
              value: state.isDarkMode,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ),
        );
      },
    );
  }
}

class LanguagePreference extends StatefulWidget {
  const LanguagePreference({super.key});

  @override
  State<LanguagePreference> createState() => _LanguagePreferenceState();
}

class _LanguagePreferenceState extends State<LanguagePreference> {
  final Map<String, String> _languageMap = {
    'English': 'english',
    'Filipino': 'filipino',
  };

  String _languageKeyFromValue(String value) {
    return _languageMap.entries.firstWhere((entry) => entry.value == value).key;
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.watch<LanguageCubit>().state.language;
    final selectedLanguage = _languageKeyFromValue(currentLanguage);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: ListTile(
        leading: const Icon(Icons.language, color: Colors.blueAccent),
        title: Text(AppLocalizations.of(context)!.generalLanguage,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        trailing: DropdownButton<String>(
          value: selectedLanguage,
          items: _languageMap.keys.map((String key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(key),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              final newLang = _languageMap[newValue]!;
              context.read<LanguageCubit>().setLanguage(newLang);
            }
          },
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.userRole});

  final UserRole userRole;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  userRole.roleName == 'Guest' ? Colors.blue : Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              try {
                StorageManager().deleteData('user_id');
                context.read<UserCubit>().clearUser();
                await FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              } catch (e) {
                print('Error signing out $e');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.logout, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  userRole.roleName == 'Guest' ? 'LOGIN' : 'LOGOUT',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
