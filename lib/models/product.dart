class Product {
  int? id;
  String? name;
  String? price;
  String? description;
  int? storeId;
  String? image;
  int? quantity;

  Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.storeId,
      this.image,
      this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    storeId = json['store_id'];
    image = json['image'];
    quantity = json['quantity'];
  }

  Product.fromJson2(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    storeId = json['store_id'];
    image = json['image_url'];
    quantity = json['quantity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['store_id'] = storeId;
    data['image'] = image;
    data['quantity'] = quantity;
    return data;
  }
}

class Products {
  List<Product>? listOfProduct;

  Products({this.listOfProduct});

  Products.fromJson(List<dynamic> jsonList) {
    listOfProduct = <Product>[];
    for (var v in jsonList) {
      listOfProduct!.add(Product.fromJson(v));
    }
  }

  List<Map<String, dynamic>>? toJson() {
    return listOfProduct?.map((v) => v.toJson()).toList();
  }
}
