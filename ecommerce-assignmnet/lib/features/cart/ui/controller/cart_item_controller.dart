import 'package:assignment_project/features/cart/data/cart_pagination_model.dart';
import 'package:get/get.dart';

import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';

class CartItemScreenController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialProgress => _page == 1 && _inProgress;

  String? _errorMessage;
  String? _successMessage;

  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  List<CartModel> _cartItemList = [];
  List<CartModel> get cartItemList => _cartItemList;

  final int _count = 10;
  int _page = 1;
  int? _lastPage;

  int get count => _count;
  int? get lastPage => _lastPage;
  int get page => _page;

  Future<bool> getCartItemList({bool isRefresh = false}) async {
    await Get.find<AuthController>().getUserData();
    String? accessToken = Get.find<AuthController>().accessToken;

    if (accessToken == null || accessToken.isEmpty) {
      _errorMessage = "Authentication token is missing.";
      update();
      return false;
    }

    if (isRefresh) {
      _page = 1;
      _lastPage = null;
      _cartItemList.clear();
    }

    if (_lastPage != null && _page > _lastPage!) {
      return false;
    }

    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.cartPostUrl,
      queryParams: {'count': _count, 'page': _page},
      accessToken: accessToken,
    );

    bool isSuccess = false;

    if (response.isSuccess) {
      CartPaginationModel cartItemListModel = CartPaginationModel.fromJson(response.responseData);

      if (_page == 1) {
        _cartItemList = cartItemListModel.cartItemData?.results ?? [];
      } else {
        _cartItemList.addAll(cartItemListModel.cartItemData?.results ?? []);
      }

      _lastPage = cartItemListModel.cartItemData?.lastPage;
      _page++;

      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
  //
  // Future<bool> refreshCartItemList() async {
  //   return getCartItemList(isRefresh: true);
  // }
  //
  // Future<bool> updateCartItemQuantity(String cartItemId, int quantity) async {
  //   await Get.find<AuthController>().getUserData();
  //   String? accessToken = Get.find<AuthController>().accessToken; // Fixed incorrect variable name
  //
  //   if (accessToken == null || accessToken.isEmpty) {
  //     _errorMessage = "Authentication token is missing.";
  //     update();
  //     return false;
  //   }
  //
  //   bool isSuccess = false;
  //   _inProgress = true;
  //   update();
  //
  //   Map<String, dynamic> body = {"quantity": quantity};
  //
  //   NetworkResponse response = await Get.find<NetworkCaller>().patchRequest(
  //     '${Urls.cartUrl}/$cartItemId',
  //     accessToken: accessToken,
  //     body: body,
  //   );
  //
  //   if (response.isSuccess) {
  //     _successMessage = "Cart item updated successfully";
  //     isSuccess = true;
  //     getCartItemList(isRefresh: true);
  //   } else {
  //     _errorMessage = response.errorMessage;
  //   }
  //
  //   _inProgress = false;
  //   update();
  //   return isSuccess;
  // }
  //
  // Future<bool> deleteCartItem(String cartItemId) async {
  //   await Get.find<AuthController>().getUserData();
  //   String? accessToken = Get.find<AuthController>().accessToken; // Fixed incorrect variable name
  //
  //   if (accessToken == null || accessToken.isEmpty) {
  //     _errorMessage = "Authentication token is missing.";
  //     update();
  //     return false;
  //   }
  //
  //   bool isSuccess = false;
  //   _inProgress = true;
  //   update();
  //
  //   NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(
  //     '${Urls.cartUrl}/$cartItemId',
  //     accessToken,
  //   );
  //
  //   if (response.isSuccess) {
  //     _successMessage = "Cart item deleted successfully";
  //     isSuccess = true;
  //     getCartItemList(isRefresh: true);
  //   } else {
  //     _errorMessage = response.errorMessage;
  //   }
  //
  //   _inProgress = false;
  //   update();
  //   return isSuccess;
  // }
}
