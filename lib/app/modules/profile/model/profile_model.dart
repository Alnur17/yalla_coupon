class ProfileModel {
  ProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.role,
    required this.user,
  });

  final String? id;
  final String? role;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      role: json["role"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.id,
    required this.email,
    required this.v,
    required this.copies,
    required this.country,
    required this.createdAt,
    required this.image,
    required this.isBlocked,
    required this.isDeleted,
    required this.name,
    required this.phone,
    required this.updatedAt,
  });

  final String? id;
  final String? email;
  final int? v;
  final int? copies;
  final String? country;
  final DateTime? createdAt;
  final dynamic image;
  final bool? isBlocked;
  final bool? isDeleted;
  final dynamic name;
  final String? phone;
  final DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
      email: json["email"],
      v: json["__v"],
      copies: json["copies"],
      country: json["country"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      image: json["image"],
      isBlocked: json["isBlocked"],
      isDeleted: json["isDeleted"],
      name: json["name"],
      phone: json["phone"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}
