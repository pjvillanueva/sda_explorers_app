import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final double size;
  final Color outerColor;
  final Color middleColor;
  final Color innerColor;
  final String avatar;
  final double imagePadding;
  final bool showEditButton;
  final VoidCallback? onEdit;

  const AppAvatar({
    super.key,
    this.size = 54.0,
    this.outerColor = Colors.blue,
    this.middleColor = const Color(0xFFBBDEFB),
    this.innerColor = Colors.blue,
    required this.avatar,
    this.imagePadding = 3.0,
    this.showEditButton = false,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final double outerRadius = size / 2;
    final double middleRadius = outerRadius - 2;
    final double innerRadius = middleRadius - 3;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: outerRadius,
            backgroundColor: outerColor,
            child: CircleAvatar(
              radius: middleRadius,
              backgroundColor: middleColor,
              child: CircleAvatar(
                radius: innerRadius,
                backgroundColor: innerColor,
                child: Padding(
                  padding: EdgeInsets.all(imagePadding),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/avatars/$avatar.png',
                      fit: BoxFit.contain,
                      width: (innerRadius - imagePadding) * 2,
                      height: (innerRadius - imagePadding) * 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (showEditButton)
            Positioned(
              bottom: 2,
              right: 5,
              child: GestureDetector(
                onTap: onEdit,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(
                    Icons.edit,
                    size: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
