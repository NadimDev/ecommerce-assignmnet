import 'package:assignment_project/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:assignment_project/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:assignment_project/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:assignment_project/features/cart/ui/controller/cart_item_controller.dart';
import 'package:assignment_project/features/common/ui/controllers/auth_controller.dart';
import 'package:assignment_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:assignment_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:assignment_project/features/product/ui/controllers/product_list_controller.dart';
import 'package:assignment_project/features/product/ui/controllers/product_review/create_product_review_controller.dart';
import 'package:assignment_project/features/product/ui/controllers/product_review/product_review_controller.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../features/home/ui/controllers/slider_list_controller.dart';
import '../features/product/ui/controllers/product_list_controller_by_id.dart';
import '../features/product/ui/controllers/product_list_controller_category.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(OtpVerificationController());
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(ProductListController());
    Get.put(ProductListControllerById());
    Get.put(ProductListControllerCategory());
    Get.put(ProductReviewController());
    Get.put(CreateProductReviewController());
    Get.put(CartItemScreenController());
  }
}
