import 'package:assignment_project/app/urls.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../data/models/product_review/product_review_model.dart';

class ProductReviewController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ProductReview> _reviews = [];

  List<ProductReview> get reviews => _reviews;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductReviews(String productId) async {
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productReviewsUrl(productId),
    );

    if (response.isSuccess) {
      ProductReviewResponse reviewResponse =
          ProductReviewResponse.fromJson(response.responseData);
      _reviews = reviewResponse.data?.reviews ?? [];
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return response.isSuccess;
  }
}
