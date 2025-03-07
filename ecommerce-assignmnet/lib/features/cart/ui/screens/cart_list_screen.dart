import 'package:assignment_project/app/app_colors.dart';
import 'package:assignment_project/features/cart/ui/controller/cart_item_controller.dart';
import 'package:assignment_project/features/cart/ui/widgets/cart_product_item_widget.dart';
import 'package:assignment_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  CartItemScreenController cartListController =
      Get.find<CartItemScreenController>();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    cartListController.getCartItemList();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CartItemScreenController>(builder: (controller) {
          if (controller.initialProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItemList.length,
                  itemBuilder: (context, index) {
                    return CartProductItemWidget(
                      cartModel: controller.cartItemList[index],
                    );
                  },
                ),
              ),
              _buildPriceAndCheckoutSection(textTheme),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              const Text(
                '\$100039',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
