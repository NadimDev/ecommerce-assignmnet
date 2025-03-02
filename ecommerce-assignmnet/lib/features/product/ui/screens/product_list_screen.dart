import 'package:assignment_project/features/product/ui/controllers/product_list_controller.dart';
import 'package:assignment_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:assignment_project/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_list_controller_category.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = '/product/product-list-by-category';

  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final String categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController =
  Get.find<ProductListController>();
  @override
  void initState() {
    super.initState();
   // _productListController.getProductList();
     Get.find<ProductListControllerCategory>()
         .getProductListCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductListController>(builder: (controller) {
        if (controller.inProgress) {
          return const CenteredCircularProgressIndicator();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            return FittedBox(
              child: ProductItemWidget(
                productModel: controller.productList[index],
              ),
            );
          },
        );
      }),
    );
  }
}
