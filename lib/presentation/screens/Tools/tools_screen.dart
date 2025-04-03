import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Tools',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ToolsListTile(icon: Icons.auto_stories_outlined, title: 'Bible'),
                  ToolsListTile(icon: Icons.church_outlined, title: 'Church Finder'),
                  ToolsListTile(icon: Icons.groups, title: 'About Us'),
                  ToolsListTile(icon: Icons.paid_outlined, title: 'Donate'),
                ],
              ))),
    );
  }
}

class ToolsListTile extends StatelessWidget {
  const ToolsListTile({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Icon(icon, color: Colors.blue,),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text(
          //   'Subtitle text',
          //   style: TextStyle(color: Colors.grey[600]),
          // ),
          // trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {}),
    );
  }
}
