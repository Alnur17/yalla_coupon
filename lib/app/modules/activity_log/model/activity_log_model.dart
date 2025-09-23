class ActivityLogModel {
  ActivityLogModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ActivityLogModel.fromJson(Map<String, dynamic> json){
    return ActivityLogModel(
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

  final List<ActivityDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<ActivityDatum>.from(json["data"]!.map((x) => ActivityDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class ActivityDatum {
  ActivityDatum({
    required this.items,
    required this.label,
  });

  final List<Item> items;
  final String? label;

  factory ActivityDatum.fromJson(Map<String, dynamic> json){
    return ActivityDatum(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      label: json["label"],
    );
  }

}

class Item {
  Item({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.dateLabel,
    required this.sortKey,
    required this.couponTitle,
    required this.storeName,
    required this.storeImage,
  });

  final String? id;
  final String? type;
  final DateTime? createdAt;
  final String? dateLabel;
  final int? sortKey;
  final String? couponTitle;
  final String? storeName;
  final String? storeImage;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["_id"],
      type: json["type"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      dateLabel: json["dateLabel"],
      sortKey: json["sortKey"],
      couponTitle: json["couponTitle"],
      storeName: json["storeName"],
      storeImage: json["storeImage"],
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
