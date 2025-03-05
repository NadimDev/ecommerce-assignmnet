class CartPaginationModel {
  int? code;
  String? status;
  String? msg;
  CartDataItem? cartItemData;

  CartPaginationModel({this.code, this.status, this.msg, this.cartItemData});

  CartPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    cartItemData = json['data'] != null ? CartDataItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'msg': msg,
      'data': cartItemData?.toJson(),
    };
  }
}

class CartDataItem {
  List<CartModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  CartDataItem({this.results, this.total, this.firstPage, this.previous, this.next, this.lastPage});

  CartDataItem.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = List<CartModel>.from(json['results'].map((x) => CartModel.fromJson(x)));
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results?.map((x) => x.toJson()).toList(),
      'total': total,
      'first_page': firstPage,
      'previous': previous,
      'next': next,
      'last_page': lastPage,
    };
  }
}

class CartModel {
  String? id;
  Product? product;
  String? user;
  int? quantity;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  int? version;

  CartModel({this.id, this.product, this.user, this.quantity, this.color, this.size, this.createdAt, this.updatedAt, this.version});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color']?.toString(); // Fixed `Null` issue
    size = json['size']?.toString(); // Fixed `Null` issue
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product': product?.toJson(),
      'user': user,
      'quantity': quantity,
      'color': color,
      'size': size,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}

class Product {
  String? id;
  String? title;
  String? brand;
  List<String>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? version;

  Product({this.id, this.title, this.brand, this.categories, this.slug, this.metaDescription, this.description, this.photos, this.colors, this.sizes, this.tags, this.regularPrice, this.currentPrice, this.quantity, this.createdAt, this.updatedAt, this.version});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    brand = json['brand'];
    categories = List<String>.from(json['categories'] ?? []);
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = List<String>.from(json['photos'] ?? []);
    colors = List<String>.from(json['colors'] ?? []);
    sizes = List<String>.from(json['sizes'] ?? []);
    tags = List<String>.from(json['tags'] ?? []);
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'brand': brand,
      'categories': categories,
      'slug': slug,
      'meta_description': metaDescription,
      'description': description,
      'photos': photos,
      'colors': colors,
      'sizes': sizes,
      'tags': tags,
      'regular_price': regularPrice,
      'current_price': currentPrice,
      'quantity': quantity,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': version,
    };
  }
}
