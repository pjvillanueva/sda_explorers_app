import 'package:flutter/material.dart';

class ExplorerProgressBar extends StatelessWidget {
  const ExplorerProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Progress',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text('20%',
                  style: TextStyle(fontSize: 14.0, color: Colors.white)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Students',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text('10', style: TextStyle(fontSize: 14.0, color: Colors.white)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Points',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text('1218',
                  style: TextStyle(fontSize: 14.0, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
