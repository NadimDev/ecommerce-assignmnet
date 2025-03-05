import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/snack_bar_message.dart';
import '../controllers/product_review/create_product_review_controller.dart';

class ProductReviewCreateScreen extends StatefulWidget {
  static const String name = 'product/reviewCreate';

  const ProductReviewCreateScreen({super.key});

  @override
  State<ProductReviewCreateScreen> createState() =>
      _ProductReviewCreateScreenState();
}

class _ProductReviewCreateScreenState extends State<ProductReviewCreateScreen> {
  final CreateProductReviewController _createProductReview =
      Get.find<CreateProductReviewController>();
  final TextEditingController _productIdTEController = TextEditingController();
  final TextEditingController _commentTEController = TextEditingController();
  final TextEditingController _ratingTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productIdTEController,
                  decoration: const InputDecoration(hintText: 'Product Id'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter product ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _commentTEController,
                  decoration: const InputDecoration(hintText: 'Comment'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a comment';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ratingTEController,
                  decoration: const InputDecoration(hintText: 'Rating (1-5)'),
                  // ✅ Ensures numeric input
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapSubmitButton, // ✅ Assigned function
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() async {
    if (_formKey.currentState!.validate()) {
      int rating = int.parse(_ratingTEController.text); // ✅ Convert to int
      bool isSuccess = await _createProductReview.createProductReviews(
          productId: _productIdTEController.text,
          comment: _commentTEController.text,
          rating: _ratingTEController.text);
      if (isSuccess) {
        showSnackBarMessage(context, 'Review created successfully');
        _productIdTEController.clear();
        _commentTEController.clear();
        _ratingTEController.clear();
      } else {
        if (mounted) {
          showSnackBarMessage(context, _createProductReview.errorMessage!);
        }
      }
    }
  }
}
