class AllCouponsModel {
  AllCouponsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory AllCouponsModel.fromJson(Map<String, dynamic> json){
    return AllCouponsModel(
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

  final List<AllCouponsDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<AllCouponsDatum>.from(json["data"]!.map((x) => AllCouponsDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class AllCouponsDatum {
  AllCouponsDatum({
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
    required this.isFavorite,
  });

  final String? id;
  final List<Category> store;
  final List<Category> categories;
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
  final bool? isFavorite;

  factory AllCouponsDatum.fromJson(Map<String, dynamic> json){
    return AllCouponsDatum(
      id: json["_id"],
      store: json["store"] == null ? [] : List<Category>.from(json["store"]!.map((x) => Category.fromJson(x))),
      categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
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
      isFavorite: json["isFavorite"],
    );
  }

}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
  });

  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? image;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["_id"],
      name: json["name"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      image: json["image"],
    );
  }

}

class Meta {
  Meta({
    required this.total,
    required this.limit,
    required this.page,
  });

  final int? total;
  final int? limit;
  final int? page;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      total: json["total"],
      limit: json["limit"],
      page: json["page"],
    );
  }

}
