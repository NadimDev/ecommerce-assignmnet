import 'package:assignment_project/app/urls.dart';
import 'package:assignment_project/features/home/data/models/slider_model.dart';
import 'package:assignment_project/features/home/data/models/slider_pagination_model.dart';
import 'package:assignment_project/features/product/data/models/product_model.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../data/models/product_pagination_model.dart';

class ProductListControllerCategory extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductPaginationModel? _productPaginationModel;

  List<ProductModel> get productList => _productPaginationModel?.data?.results ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductListCategory(String categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.productListByCategoryUrl(categoryId));
    if (response.isSuccess) {
      _productPaginationModel =
          ProductPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}