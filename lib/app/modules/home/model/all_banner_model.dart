class AllBannerModel {
  AllBannerModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory AllBannerModel.fromJson(Map<String, dynamic> json){
    return AllBannerModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.data,
    required this.meta,
  });

  final List<AllBannerDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<AllBannerDatum>.from(json["data"]!.map((x) => AllBannerDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class AllBannerDatum {
  AllBannerDatum({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.coupon,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? image;
  final String? title;
  final String? subTitle;
  final Coupon? coupon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory AllBannerDatum.fromJson(Map<String, dynamic> json){
    return AllBannerDatum(
      id: json["_id"],
      image: json["image"],
      title: json["title"],
      subTitle: json["subTitle"],
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
    required this.type,
  });

  final String? id;
  final String? code;
  final String? type;

  factory Coupon.fromJson(Map<String, dynamic> json){
    return Coupon(
      id: json["_id"],
      code: json["code"],
      type: json["type"],
    );
  }

}

class Meta {
  Meta({
    required this.total,
    required this.page,
    required this.limit,
  });

  final int? total;
  final int? page;
  final int? limit;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      total: json["total"],
      page: json["page"],
      limit: json["limit"],
    );
  }

}
