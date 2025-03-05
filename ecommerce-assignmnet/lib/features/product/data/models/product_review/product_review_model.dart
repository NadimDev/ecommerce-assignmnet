class ProductReviewResponse {
  int? code;
  String? status;
  String? message;
  ProductReviewData? data;

  ProductReviewResponse({this.code, this.status, this.message, this.data});

  ProductReviewResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['msg'];
    data = json['data'] != null ? ProductReviewData.fromJson(json['data']) : null;
  }
}

class ProductReviewData {
  List<ProductReview>? reviews;
  int? total;
  int? nextPage;
  int? lastPage;

  ProductReviewData({this.reviews, this.total, this.nextPage, this.lastPage});

  ProductReviewData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      reviews = (json['results'] as List).map((v) => ProductReview.fromJson(v)).toList();
    }
    total = json['total'];
    nextPage = json['next'];
    lastPage = json['last_page'];
  }
}

class ProductReview {
  String? id;
  ProductDetails? product;
  UserDetails? user;
  double? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  int? version;

  ProductReview({this.id, this.product, this.user, this.rating, this.comment, this.createdAt, this.updatedAt, this.version});

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    product = json['product'] != null ? ProductDetails.fromJson(json['product']) : null;
    user = json['user'] != null ? UserDetails.fromJson(json['user']) : null;
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }
}

class ProductDetails {
  String? id;
  String? title;
  String? slug;
  List<String>? images;

  ProductDetails({this.id, this.title, this.slug, this.images});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    images = List<String>.from(json['photos'] ?? []);
  }
}

class UserDetails {
  String? id;
  String? firstName;
  String? lastName;
  String? avatarUrl;

  UserDetails({this.id, this.firstName, this.lastName, this.avatarUrl});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatarUrl = json['avatar_url'];
  }
}
