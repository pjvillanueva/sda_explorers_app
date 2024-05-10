// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:equatable/equatable.dart';

class ModelClass extends Equatable {
  ModelClass(
      {required this.field1,
      required this.field2,
      required this.field3,
      required this.field4,
      required this.field5,
      required this.field6,
      required this.field7,
      required this.field8});

  final String field1;
  final String field2;
  final String field3;
  final String field4;
  final String field5;
  final String field6;
  final String field7;
  final String field8;

  @override
  List<Object?> get props =>
      [field1, field2, field3, field4, field5, field6, field7, field8];

  @override
  String toString() =>
      'ModelClass : (field1: $field1, field2: $field2, field3: $field3, field4: $field4, field5: $field5, field6: $field6, field7: $field7, field8: $field8)';

  ModelClass.fromJson(Map<String, dynamic> json)
      : field1 = json['field1'],
        field2 = json['field2'],
        field3 = json['field3'],
        field4 = json['field4'],
        field5 = json['field5'],
        field6 = json['field6'],
        field7 = json['field7'],
        field8 = json['field8'];

  Map<String, dynamic> toJson() => {
        'field1': field1,
        'field2': field2,
        'field3': field3,
        'field4': field4,
        'field5': field5,
        'field6': field6,
        'field7': field7,
        'field8': field8,
      };
}

//How to serialize and deserialize different type

//STRING
//  ModelClass.fromJson(Map<String, dynamic> json)
//       : field1 = json['field1'];

// Map<String, dynamic> toJson() => {'field1': field1};


//INT
//  ModelClass.fromJson(Map<String, dynamic> json)
//       : field1 = json['field1'];

// Map<String, dynamic> toJson() => {'field1': field1};


//BOOL
//  ModelClass.fromJson(Map<String, dynamic> json)
//       : field1 = json['field1'];

// Map<String, dynamic> toJson() => {'field1': field1};


//DOUBLE
//  ModelClass.fromJson(Map<String, dynamic> json)
//       : field1 = double.parse(json['field1'].toString());

// Map<String, dynamic> toJson() => {'field1': field1};


// OBJECTS


//ENUM
// getEntryData(EntryType type, dynamic jsonData) {
//   switch (type) {
//     case EntryType.book:
//       return BookEntryData.fromJson(jsonData);
//     case EntryType.contact:
//       return Contact.fromJson(jsonData);
//     case EntryType.money:
//       return MoneyEntryData.fromJson(jsonData);
//     case EntryType.notes:
//       return jsonData;
//     case EntryType.prayer:
//       return jsonData;
//   }
// }


//DATE TIME


//LIST OF OBJECTS

