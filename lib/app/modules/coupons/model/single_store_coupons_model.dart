class SingleStoreCouponsModel {
  SingleStoreCouponsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory SingleStoreCouponsModel.fromJson(Map<String, dynamic> json){
    return SingleStoreCouponsModel(
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

  final List<SingleStoreCouponsDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<SingleStoreCouponsDatum>.from(json["data"]!.map((x) => SingleStoreCouponsDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class SingleStoreCouponsDatum {
  SingleStoreCouponsDatum({
    required this.id,
    required this.store,
    required this.countries,
    required this.link,
    required this.fakeUses,
    required this.realUses,
    required this.code,
    required this.title,
    required this.subtitle,
    required this.validity,
    required this.type,
    required this.status,
    required this.applicableUserType,
    required this.howToUse,
    required this.terms,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final Store? store;
  final List<String> countries;
  final String? link;
  final int? fakeUses;
  final int? realUses;
  final String? code;
  final String? title;
  final String? subtitle;
  final DateTime? validity;
  final String? type;
  final String? status;
  final String? applicableUserType;
  final List<String> howToUse;
  final List<String> terms;
  final bool? isFeatured;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory SingleStoreCouponsDatum.fromJson(Map<String, dynamic> json){
    return SingleStoreCouponsDatum(
      id: json["_id"],
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
      countries: json["countries"] == null ? [] : List<String>.from(json["countries"]!.map((x) => x)),
      link: json["link"],
      fakeUses: json["fakeUses"],
      realUses: json["realUses"],
      code: json["code"],
      title: json["title"],
      subtitle: json["subtitle"],
      validity: DateTime.tryParse(json["validity"] ?? ""),
      type: json["type"],
      status: json["status"],
      applicableUserType: json["applicableUserType"],
      howToUse: json["howToUse"] == null ? [] : List<String>.from(json["howToUse"]!.map((x) => x)),
      terms: json["terms"] == null ? [] : List<String>.from(json["terms"]!.map((x) => x)),
      isFeatured: json["isFeatured"],
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
    required this.thumbnail,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final String? image;
  final String? thumbnail;
  final List<String> categories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      thumbnail: json["thumbnail"],
      categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
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
