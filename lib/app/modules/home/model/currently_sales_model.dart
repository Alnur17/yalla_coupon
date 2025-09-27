class CurrentlySalesModel {
  CurrentlySalesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<CurrentlySalesDatum> data;

  factory CurrentlySalesModel.fromJson(Map<String, dynamic> json){
    return CurrentlySalesModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? [] : List<CurrentlySalesDatum>.from(json["data"]!.map((x) => CurrentlySalesDatum.fromJson(x))),
    );
  }

}

class CurrentlySalesDatum {
  CurrentlySalesDatum({
    required this.id,
    required this.image,
    required this.coupon,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? image;
  final Coupon? coupon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory CurrentlySalesDatum.fromJson(Map<String, dynamic> json){
    return CurrentlySalesDatum(
      id: json["_id"],
      image: json["image"],
      coupon: json["coupon"] == null ? null : Coupon.fromJson(json["coupon"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class Coupon {
  Coupon({
    required this.id,
    required this.code,
    required this.title,
  });

  final String? id;
  final String? code;
  final String? title;

  factory Coupon.fromJson(Map<String, dynamic> json){
    return Coupon(
      id: json["_id"],
      code: json["code"],
      title: json["title"],
    );
  }

}
