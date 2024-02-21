import 'package:bite_bringers/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? image;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }
  Map<String, dynamic> toJson(){
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "image": this.image,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson(),
    };
  }
}
