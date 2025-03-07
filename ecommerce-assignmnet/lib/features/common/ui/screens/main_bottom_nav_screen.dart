import 'package:assignment_project/features/cart/ui/controller/cart_item_controller.dart';
import 'package:assignment_project/features/cart/ui/screens/cart_list_screen.dart';
import 'package:assignment_project/features/category/ui/screens/category_list_screen.dart';
import 'package:assignment_project/features/common/ui/controllers/category_list_controller.dart';
import 'package:assignment_project/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:assignment_project/features/home/ui/controllers/slider_list_controller.dart';
import 'package:assignment_project/features/home/ui/screens/home_screen.dart';
import 'package:assignment_project/features/product/ui/controllers/product_list_controller.dart';
import 'package:assignment_project/features/product/ui/controllers/product_list_controller_by_id.dart';
import 'package:assignment_project/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliders();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<ProductListController>().getProductList();
    Get.find<CartItemScreenController>().getCartItemList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavController.selectedIndex,
          onDestinationSelected: bottomNavController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
