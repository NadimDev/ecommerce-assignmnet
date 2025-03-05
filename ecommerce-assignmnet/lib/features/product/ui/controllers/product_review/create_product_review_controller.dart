import 'package:assignment_project/app/urls.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> createProductReviews(
      {required String productId,
      required String comment,
      required String rating}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final requestParams = {
      "product": productId,
      "comment": comment,
      "rating": rating,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.createProductReviewUrl, body: requestParams);

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
