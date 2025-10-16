class AllStoreModel {
  AllStoreModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory AllStoreModel.fromJson(Map<String, dynamic> json){
    return AllStoreModel(
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

  final List<AllStoreDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<AllStoreDatum>.from(json["data"]!.map((x) => AllStoreDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class AllStoreDatum {
  AllStoreDatum({
    required this.id,
    required this.name,
    required this.image,
    required this.thumbnail,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.couponCount,
  });

  final String? id;
  final String? name;
  final String? image;
  final String? thumbnail;
  final List<String> categories;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? couponCount;

  factory AllStoreDatum.fromJson(Map<String, dynamic> json){
    return AllStoreDatum(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      thumbnail: json["thumbnail"],
      categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      couponCount: json["couponCount"],
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
