// User class definition
class User {
  User(this.id, this.firstName, this.lastName, this.email, this.phoneNumber, 
      {this.imageUrl, this.avatar, this.backgroundColor, this.expPoints});

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? imageUrl;
  final String? avatar;
  final String? backgroundColor;
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
      'avatar': avatar,
      'backgroundColor': backgroundColor,
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
      avatar: json['avatar'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      expPoints: json['expPoints'] as int? ?? 0,
    );
  }

  copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? imageUrl,
    String? avatar,
    String? backgroundColor,
    int? expPoints,
  }) {
    return User(
      id ?? this.id,
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      email ?? this.email,
      phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      avatar: avatar ?? this.avatar,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expPoints: expPoints ?? this.expPoints,
    );
  }
  
  String get firstWordOfFirstName {
    return firstName.split(' ').first;
  }

  String get fullName {
    return '$firstName $lastName';
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, imageUrl: $imageUrl, avatar: $avatar, backgroundColor: $backgroundColor, expPoints: $expPoints}';
  }
}
