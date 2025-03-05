import 'package:assignment_project/app/app_colors.dart';
import 'package:assignment_project/features/product/ui/screens/product_review_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_review/product_review_controller.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  static const String name = 'product/reviewScreen';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  final ProductReviewController _reviewController =
      Get.find<ProductReviewController>();

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    await _reviewController
        .getProductReviews("your_product_id_here"); // Pass actual product ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Review')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GetBuilder<ProductReviewController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.errorMessage != null) {
                    return Center(
                        child: Text("Error: ${controller.errorMessage}"));
                  }

                  if (controller.reviews.isEmpty) {
                    return const Center(child: Text("No reviews found."));
                  }

                  return ListView.builder(
                    itemCount: controller.reviews.length,
                    itemBuilder: (context, index) {
                      final review = controller.reviews[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      elevation: 2,
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${review.user?.firstName ?? "Unknown"} ${review.user?.lastName ?? ""}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  review.comment ?? "No comment provided.",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          _totalPriceCardSection(),
        ],
      ),
    );
  }

  Widget _totalPriceCardSection() {
    return GetBuilder<ProductReviewController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration:
              BoxDecoration(color: AppColors.themeColor.withOpacity(0.15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reviews'),
                  Text(' (${controller.reviews.length})'),
                ],
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ProductReviewCreateScreen.name);
                  },
                  child: const Icon(Icons.add, color: Colors.white, size: 24),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
