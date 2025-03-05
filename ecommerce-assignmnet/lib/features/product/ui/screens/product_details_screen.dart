import 'package:assignment_project/app/app_colors.dart';
import 'package:assignment_project/app/urls.dart';
import 'package:assignment_project/features/common/ui/controllers/auth_controller.dart';
import 'package:assignment_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:assignment_project/features/product/data/models/product_model_by_id.dart';
import 'package:assignment_project/features/product/ui/controllers/product_list_controller_by_id.dart';
import 'package:assignment_project/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:assignment_project/features/product/ui/screens/product_review_screen.dart';
import 'package:assignment_project/services/network_caller/network_caller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int? _productPrice;
  AuthController authController = Get.find<AuthController>();
  Map<String, dynamic>? _map;
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  @override
  void initState() {
    super.initState();
    Get.find<ProductListControllerById>().getProductList(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductListControllerById>(builder: (controller) {
        if (controller.inProgress) {
          return const CenteredCircularProgressIndicator();
        }

        if (controller.errorMessage != null) {
          return Center(
            child: Text(controller.errorMessage!),
          );
        }

        ProductModelById productDetails = controller.productDetails!;
        _map = {
          'product': '${productDetails.sId}',
        };
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 184,
                      height: 184,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                              image:
                                  NetworkImage(productDetails.brand!.icon!))),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productDetails.title ?? '',
                                      textAlign: TextAlign.start,
                                      style: textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${productDetails.quantity ?? ''}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                ProductReviewScreen.name);
                                          },
                                          child: const Text('Reviews'),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: AppColors.themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: const Icon(
                                            Icons.favorite_border,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              ProductQuantityIncDecButton(
                                onChange: (int value) {
                                  setState(() {});
                                  _productPrice =
                                      value * productDetails.currentPrice!;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Color', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          const SizedBox(height: 16),
                          Text('Size', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          const SizedBox(height: 16),
                          Text('Description', style: textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text(
                            productDetails.description ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(textTheme, _productPrice ?? 0)
          ],
        );
      }),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme, int price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text(
                '\$$price',
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                _networkCaller.postRequest(Urls.cartPostUrl,
                    body: _map, accessToken: authController.accessToken);
              },
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
