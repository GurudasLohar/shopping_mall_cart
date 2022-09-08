class CartItemModel{

  int? id;
  final String? title;
  final int? price;
  final String? featuredImage;
/*  final int? totalItem;
  final int? totalAmount;*/

  CartItemModel({
    this.id,
    this.title,
    this.price,
    this.featuredImage,
/*    this.totalItem = 0,
    this.totalAmount =0*/
  });

  factory CartItemModel.fromJSON(Map<String,dynamic> json) {
    return CartItemModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      featuredImage: json['featuredImage'],
    );
  }

  Map<String,dynamic> toJSON(){
    return {
      'id': id,
      'title': title,
      'price': price,
      'featuredImage': featuredImage,
    };
  }

}
