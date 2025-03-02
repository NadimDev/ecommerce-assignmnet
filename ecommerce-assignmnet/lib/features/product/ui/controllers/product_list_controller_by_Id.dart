import 'package:assignment_project/app/urls.dart';
import 'package:assignment_project/features/product/data/models/product_model_by_id.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';


class ProductListControllerById extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductPaginationModelById? _productPaginationModelById;

  ProductModelById? get productDetails => _productPaginationModelById?.data!;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productListByIdUrl(productId));
    if (response.isSuccess) {
      _productPaginationModelById =
          ProductPaginationModelById.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}