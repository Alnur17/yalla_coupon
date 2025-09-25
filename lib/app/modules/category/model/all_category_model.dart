class AllCategoryModel {
  AllCategoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory AllCategoryModel.fromJson(Map<String, dynamic> json){
    return AllCategoryModel(
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

  final List<AllCategoryDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<AllCategoryDatum>.from(json["data"]!.map((x) => AllCategoryDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class AllCategoryDatum {
  AllCategoryDatum({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.storeCount,
  });

  final String? id;
  final String? name;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? storeCount;

  factory AllCategoryDatum.fromJson(Map<String, dynamic> json){
    return AllCategoryDatum(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      storeCount: json["storeCount"],
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
