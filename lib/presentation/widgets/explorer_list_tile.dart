import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/logic/services/helpers.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/avatar.dart';
import 'package:sda_explorers_app/presentation/screens/Home/screens/ExplorerDetails/explorer_detail_screen.dart';

class ExplorerListTile extends StatelessWidget {
  const ExplorerListTile({super.key, required this.explorer});

  final Explorer explorer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: AppAvatar(
          size: 54.0,
          innerColor: colorFromHex(explorer.user?.backgroundColor),
          avatar: explorer.user?.avatar ?? 'matthew',
        ),
        title: Text(
          explorer.user?.fullName ?? 'Unknown Explorer',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: const Row(
          children: [
            Row(
              children: [
                Icon(Icons.book, size: 15, color: Colors.grey),
                SizedBox(width: 2),
                Text('1/24', style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(width: 15),
            Row(
              children: [
                Icon(Icons.check_circle, size: 15, color: Colors.grey),
                SizedBox(width: 2),
                Text('1/24', style: TextStyle(color: Colors.grey))
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ExplorerDetailScreen(explorer: explorer)));
        },
      ),
    );
  }
}
