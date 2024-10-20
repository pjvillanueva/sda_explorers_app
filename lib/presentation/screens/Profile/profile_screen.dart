import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: const Color.fromRGBO(229, 172, 63, 1)),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 70,
                    // backgroundImage: NetworkImage('https://example.com/profile-image.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.user?.fullName ?? 'Unknown',
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // const Text(
                  //   'Software Developer',
                  //   style: TextStyle(fontSize: 18, color: Colors.grey),
                  // ),
                  const SizedBox(height: 24),
                  _buildInfoCard(
                      context, 'Email', '${state.user?.email}', Icons.email),
                  _buildInfoCard(context, 'Phone', '${state.user?.phoneNumber}', Icons.phone),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Add edit profile functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text('Edit Profile',
                        style: TextStyle(fontSize: 16)),
                  ),
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        tileColor: Theme.of(context).colorScheme.primary,
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
