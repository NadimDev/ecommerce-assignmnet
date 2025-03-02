class ProductPaginationModelById {
  int? code;
  String? status;
  String? msg;
  ProductModelById? data;

  ProductPaginationModelById({this.code, this.status, this.msg, this.data});

  ProductPaginationModelById.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new ProductModelById.fromJson(json['data']) : null;
  }
}

class ProductModelById {
  String? sId;
  String? title;
  Brand? brand;
  List<Categories>? categories;
  String? slug;
  Null? metaDescription;
  String? description;
  Null? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModelById(
      {this.sId,
        this.title,
        this.brand,
        this.categories,
        this.slug,
        this.metaDescription,
        this.description,
        this.regularPrice,
        this.currentPrice,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ProductModelById.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Brand {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Brand({this.sId, this.title, this.slug, this.icon});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }

}

class Categories {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Categories({this.sId, this.title, this.slug, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }
}