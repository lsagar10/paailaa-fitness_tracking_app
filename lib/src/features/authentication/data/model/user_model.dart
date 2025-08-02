class UserModel {
  final String? id;
  final String? fullName;
  final String email;
  final String? age;
  final String? gender;
  final String password;
  final String? otp;
  final String? token; // Add token field for login response

  UserModel({
    this.id,
    this.fullName,
    required this.email,
    this.age,
    this.gender,
    required this.password,
    this.otp,
    this.token,
  });

  // Existing copyWith method (update it)
  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? age,
    String? gender,
    String? password,
    String? otp,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      token: token ?? this.token,
    );
  }

  // For login request
  Map<String, dynamic> toLoginJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // For register request (existing)
  Map<String, dynamic> toJson() {
    return {
      if (fullName != null) 'full_name': fullName,
      'email': email,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      'password': password,
      if (otp != null) 'otp': otp,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      fullName: json['full_name']?.toString(),
      email: json['email']?.toString() ?? '',
      age: json['age']?.toString(),
      gender: json['gender']?.toString(),
      password: json['password']?.toString() ?? '',
      otp: json['otp']?.toString(),
      token: json['token']?.toString(),
    );
  }
}