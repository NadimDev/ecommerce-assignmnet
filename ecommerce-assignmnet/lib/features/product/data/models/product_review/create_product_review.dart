class CreateProductReviewModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  CreateProductReviewModel({this.code, this.status, this.msg, this.data});

  CreateProductReviewModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? product;
  String? user;
  int? rating;
  String? comment;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.product,
        this.user,
        this.rating,
        this.comment,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    user = json['user'];
    rating = json['rating'];
    comment = json['comment'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['user'] = this.user;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
