class FavoriteModel {
  FavoriteModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory FavoriteModel.fromJson(Map<String, dynamic> json){
    return FavoriteModel(
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

  final List<FavoriteDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<FavoriteDatum>.from(json["data"]!.map((x) => FavoriteDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class FavoriteDatum {
  FavoriteDatum({
    required this.id,
    required this.user,
    required this.coupon,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? user;
  final Coupon? coupon;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory FavoriteDatum.fromJson(Map<String, dynamic> json){
    return FavoriteDatum(
      id: json["_id"],
      user: json["user"],
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
    required this.fakeUses,
    required this.code,
    required this.title,
    required this.validity,
  });

  final String? id;
  final Store? store;
  final int? fakeUses;
  final String? code;
  final String? title;
  final DateTime? validity;

  factory Coupon.fromJson(Map<String, dynamic> json){
    return Coupon(
      id: json["_id"],
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
      fakeUses: json["fakeUses"],
      code: json["code"],
      title: json["title"],
      validity: DateTime.tryParse(json["validity"] ?? ""),
    );
  }

}

class Store {
  Store({
    required this.id,
    required this.name,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
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
