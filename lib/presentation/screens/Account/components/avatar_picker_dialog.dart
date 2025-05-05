import 'package:flutter/material.dart';

Future<String?> showAvatarPickerDialog(BuildContext context, List<String> avatarNames) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Choose Avatar'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avatarNames.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final avatarName = avatarNames[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(avatarName),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    'assets/avatars/$avatarName.png',
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          ),
        ],
      );
    },
  );
}
