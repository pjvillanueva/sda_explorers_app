//Codes = T, M, S, P, Q, B

//L1 - lesson number
//T - text type code
//1 - placeInSequence
import 'dart:math';

enum TextType { title, memoryVerse, subtitle, paragraph, question, bibleVerse }

addIndention(String text) {
  return '          $text';
}

String intToRoman(int num) {
  // Define the Roman numerals mapping
  List<Map<String, dynamic>> romanMapping = [
    {'value': 1000, 'numeral': 'M'},
    {'value': 900, 'numeral': 'CM'},
    {'value': 500, 'numeral': 'D'},
    {'value': 400, 'numeral': 'CD'},
    {'value': 100, 'numeral': 'C'},
    {'value': 90, 'numeral': 'XC'},
    {'value': 50, 'numeral': 'L'},
    {'value': 40, 'numeral': 'XL'},
    {'value': 10, 'numeral': 'X'},
    {'value': 9, 'numeral': 'IX'},
    {'value': 5, 'numeral': 'V'},
    {'value': 4, 'numeral': 'IV'},
    {'value': 1, 'numeral': 'I'},
  ];

  String result = '';

  for (var entry in romanMapping) {
    while (num >= entry['value']) {
      result += entry['numeral'];
      num -= entry['value'] as int;
    }
  }

  return result;
}

String generateUUID() {
  final random = Random();
  final milliseconds = DateTime.now().millisecondsSinceEpoch;
  final microseconds = DateTime.now().microsecondsSinceEpoch;
  final random6digit = random.nextInt(1000000); // Random 6 digit number

  return '${milliseconds.toString()}${microseconds.toString()}${random6digit.toString().padLeft(6, '0')}';
}
