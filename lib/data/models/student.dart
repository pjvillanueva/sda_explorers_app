class Student {
  Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.isMale,
      required this.address});

  final String id;
  final String name;
  final int age;
  final bool isMale;
  final String address;

  @override
  String toString() =>
      'Student: { id: $id, name: $name, age: $age, isMale: $isMale, address: $address}';
}
