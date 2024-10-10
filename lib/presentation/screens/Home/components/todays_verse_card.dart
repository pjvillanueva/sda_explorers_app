import 'package:flutter/material.dart';

class TodaysVerseCard extends StatelessWidget {
  const TodaysVerseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue[400]!, Colors.blue[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), topRight: Radius.circular(30) ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Verse',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Text(
                'John 3:16',
                style: TextStyle(
                  
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
