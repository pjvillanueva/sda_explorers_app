// User class definition
class User {
  User(this.id, this.firstName, this.lastName, this.email, this.phoneNumber, 
      {this.imageUrl, this.expPoints});

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? imageUrl;
  final int? expPoints;

  // Method to convert User object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'expPoints': expPoints,
    };
  }

  // Method to create a User object from JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
      imageUrl: json['imageUrl'] as String?,
      expPoints: json['expPoints'] as int? ?? 0,
    );
  }
  String get firstWordOfFirstName {
    return firstName.split(' ').first;
  }

  String get fullName {
    return '$firstName $lastName';
  }
}
