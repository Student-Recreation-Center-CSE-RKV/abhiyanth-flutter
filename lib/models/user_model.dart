class UserModel {
  final String? email;
  final String? uid;
  final String? name;
  final String? role;
  final String? batch;
  final String? branch;
  final String? mobile;
  final String? id;
  final DateTime? createdAt;

  UserModel({
    this.email,
    this.name,
    this.role,
    this.createdAt,
    this.batch,
    this.branch,
    this.id,
    this.mobile,
    this.uid
  });

  // From JSON method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] ?? 'user',
      role: json['role'] ?? 'student',
      id: json['id']??"",
      batch: json['batch']??"",
      branch: json['branch']??"",
      mobile: json['mobile']??"",
      createdAt: json['createdAt']??DateTime.now(),
      uid: json['uid']
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'role':role,
      'batch':batch,
      'branch':branch,
      'mobile':mobile,
      'id':id,
      'uid':uid,
      'createdAt':createdAt,
    };
  }

  @override
  String toString() {
    return 'UserModel( email: $email, name: $name, role: $role, createdAt: $createdAt,id: $id, batch: $batch, branch: $branch, mobile: $mobile, uid: $uid)';
  }
}
