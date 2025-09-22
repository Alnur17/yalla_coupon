class SingleBannerDetailsModel {
  SingleBannerDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final SingleBannerData? data;

  factory SingleBannerDetailsModel.fromJson(Map<String, dynamic> json){
    return SingleBannerDetailsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : SingleBannerData.fromJson(json["data"]),
    );
  }

}

class SingleBannerData {
  SingleBannerData({
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

  factory SingleBannerData.fromJson(Map<String, dynamic> json){
    return SingleBannerData(
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
    required this.store,
    required this.categories,
    required this.countries,
    required this.link,
    required this.fakeUses,
    required this.realUses,
    required this.code,
    required this.title,
    required this.subtitle,
    required this.validity,
    required this.status,
    required this.applicableUserType,
    required this.howToUse,
    required this.terms,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final Store? store;
  final List<String> categories;
  final List<String> countries;
  final String? link;
  final int? fakeUses;
  final int? realUses;
  final String? code;
  final String? title;
  final String? subtitle;
  final DateTime? validity;
  final String? status;
  final String? applicableUserType;
  final List<String> howToUse;
  final List<String> terms;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Coupon.fromJson(Map<String, dynamic> json){
    return Coupon(
      id: json["_id"],
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
      categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      countries: json["countries"] == null ? [] : List<String>.from(json["countries"]!.map((x) => x)),
      link: json["link"],
      fakeUses: json["fakeUses"],
      realUses: json["realUses"],
      code: json["code"],
      title: json["title"],
      subtitle: json["subtitle"],
      validity: DateTime.tryParse(json["validity"] ?? ""),
      status: json["status"],
      applicableUserType: json["applicableUserType"],
      howToUse: json["howToUse"] == null ? [] : List<String>.from(json["howToUse"]!.map((x) => x)),
      terms: json["terms"] == null ? [] : List<String>.from(json["terms"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class Store {
  Store({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
