class ConditionsModel {
  ConditionsModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ConditionsModel.fromJson(Map<String, dynamic> json){
    return ConditionsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.aboutUs,
    required this.privacyPolicy,
    required this.termsConditions,
  });

  final String? id;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? aboutUs;
  final String? privacyPolicy;
  final String? termsConditions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      v: json["__v"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      aboutUs: json["aboutUs"],
      privacyPolicy: json["privacyPolicy"],
      termsConditions: json["termsConditions"],
    );
  }

}
