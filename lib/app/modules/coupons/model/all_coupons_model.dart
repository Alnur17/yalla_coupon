class AllCouponsModel {
  AllCouponsModel({
    this.success,
    this.message,
    this.data,
  });

  final bool? success;
  final String? message;
  final AllCouponsData? data;

  factory AllCouponsModel.fromJson(Map<String, dynamic> json) {
    return AllCouponsModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] == null
          ? null
          : AllCouponsData.fromJson(json['data']),
    );
  }
}

class AllCouponsData {
  AllCouponsData({
    this.data = const [],
    this.meta,
  });

  final List<AllCouponsDatum> data;
  final Meta? meta;

  factory AllCouponsData.fromJson(Map<String, dynamic> json) {
    return AllCouponsData(
      data: (json['data'] as List<dynamic>?)
          ?.map((x) => AllCouponsDatum.fromJson(x))
          .toList() ??
          [],
      meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
    );
  }
}

class AllCouponsDatum {
  AllCouponsDatum({
    this.id,
    this.store = const [],
    this.categories = const [],
    this.countries = const [],
    this.link,
    this.fakeUses,
    this.realUses,
    this.code,
    this.title,
    this.subtitle,
    this.validity,
    this.status,
    this.applicableUserType,
    this.howToUse = const [],
    this.terms = const [],
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isFavorite,
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

  factory AllCouponsDatum.fromJson(Map<String, dynamic> json) {
    return AllCouponsDatum(
      id: json['_id'],
      store: (json['store'] as List<dynamic>?)
          ?.map((x) => Category.fromJson(x))
          .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
          ?.map((x) => Category.fromJson(x))
          .toList() ??
          [],
      countries: (json['countries'] as List<dynamic>?)
          ?.map((x) => x.toString())
          .toList() ??
          [],
      link: json['link'],
      fakeUses: json['fakeUses'],
      realUses: json['realUses'],
      code: json['code'],
      title: json['title'],
      subtitle: json['subtitle'],
      validity: DateTime.tryParse(json['validity'] ?? ''),
      status: json['status'],
      applicableUserType: json['applicableUserType'],
      howToUse: (json['howToUse'] as List<dynamic>?)
          ?.map((x) => x.toString())
          .toList() ??
          [],
      terms: (json['terms'] as List<dynamic>?)
          ?.map((x) => x.toString())
          .toList() ??
          [],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      v: json['__v'],
      isFavorite: json['isFavorite'],
    );
  }
}

class Category {
  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
  });

  final String? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? image;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      v: json['__v'],
      image: json['image'],
    );
  }
}

class Meta {
  Meta({
    this.total,
    this.limit,
    this.page,
  });

  final int? total;
  final int? limit;
  final int? page;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      limit: json['limit'],
      page: json['page'],
    );
  }
}
