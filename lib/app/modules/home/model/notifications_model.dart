class NotificationsModel {
  NotificationsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory NotificationsModel.fromJson(Map<String, dynamic> json){
    return NotificationsModel(
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

  final List<NotificationsDatum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<NotificationsDatum>.from(json["data"]!.map((x) => NotificationsDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class NotificationsDatum {
  NotificationsDatum({
    required this.id,
    required this.receiver,
    required this.title,
    required this.body,
    required this.coupon,
    required this.countries,
    required this.hasRead,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? receiver;
  final String? title;
  final String? body;
  final String? coupon;
  final List<String> countries;
  final bool? hasRead;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory NotificationsDatum.fromJson(Map<String, dynamic> json){
    return NotificationsDatum(
      id: json["_id"],
      receiver: json["receiver"],
      title: json["title"],
      body: json["body"],
      coupon: json["coupon"],
      countries: json["countries"] == null ? [] : List<String>.from(json["countries"]!.map((x) => x)),
      hasRead: json["hasRead"],
      type: json["type"],
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
