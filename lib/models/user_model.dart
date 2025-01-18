class UserModel {
  final String? email;
  final String? name;
  final String? role;
  final DateTime? createdAt;

  UserModel({
    this.email,
    this.name,
    this.role,
    this.createdAt
  });

  // From JSON method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] ?? 'user',
      role: json['role'] ?? 'student',
      createdAt: json['createdAt']??DateTime.now()
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'role':role,
      'createdAt':createdAt,
    };
  }

  @override
  String toString() {
    return 'UserModel( email: $email, name: $name, role: $role, createdAt: $createdAt';
  }
}
