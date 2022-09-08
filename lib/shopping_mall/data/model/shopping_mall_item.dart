import 'dart:convert';

ShoppingMallItemAll shoppingMallItemFromJson(String str) =>
    ShoppingMallItemAll.fromJson(json.decode(str));

String shoppingMallItemToJson(ShoppingMallItemAll data) =>
    json.encode(data.toJson());

class ShoppingMallItemAll {
  int status;
  String message;
  int totalRecord;
  int totalPage;
  List<ShoppingMallItem> data;

  ShoppingMallItemAll({
    required this.status,
    required this.message,
    required this.totalRecord,
    required this.totalPage,
    required this.data,
  });

  factory ShoppingMallItemAll.fromJson(Map<String, dynamic> json) =>
      ShoppingMallItemAll(
        status: json["status"],
        message: json["message"],
        totalRecord: json["totalRecord"],
        totalPage: json["totalPage"],
        data: List<ShoppingMallItem>.from(
            json["data"].map((x) => ShoppingMallItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalRecord": totalRecord,
        "totalPage": totalPage,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

class ShoppingMallItem {
  final int? id;
  final String? slug;
  final String? title;
  final String? description;
  final int? price;
  final String? featuredImage;
  final String? status;
  final DateTime? createdAt;

  const ShoppingMallItem({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.price,
    this.featuredImage,
    this.status,
    this.createdAt,
  });

  factory ShoppingMallItem.fromJson(Map<String, dynamic> json) =>
      ShoppingMallItem(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        featuredImage: json["featured_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "description": description,
        "price": price,
        "featured_image": featuredImage,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}
