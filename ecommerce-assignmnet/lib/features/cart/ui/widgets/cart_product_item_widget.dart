import 'package:assignment_project/app/app_colors.dart';
import 'package:assignment_project/app/assets_path.dart';
import 'package:assignment_project/features/cart/data/cart_pagination_model.dart';
import 'package:assignment_project/features/cart/ui/controller/cart_item_controller.dart';
import 'package:assignment_project/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartProductItemWidget extends StatefulWidget {
  const CartProductItemWidget({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  State<CartProductItemWidget> createState() => _CartProductItemWidgetState();
}

class _CartProductItemWidgetState extends State<CartProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<CartItemScreenController>(
      builder: (controller) {
        return Card(
          elevation: 1,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              children: [
                Image.asset(
                  widget.cartModel.product?.photos?.isNotEmpty == true
                      ? widget.cartModel.product!.photos!.first
                      : 'https://media.istockphoto.com/id/1180410208/vector/landscape-image-gallery-with-the-photos-stack-up.jpg?s=612x612&w=0&k=20&c=G21-jgMQruADLPDBk7Sf1vVvCEtPiJD3Rf39AeB95yI=',
                  width: 100,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  widget.cartModel.product?.title ?? '',
                                  maxLines: 1,
                                  style: textTheme.bodyLarge
                                      ?.copyWith(overflow: TextOverflow.ellipsis),
                                ),
                                Row(
                                  children: [
                                    Text(widget.cartModel.color ?? ''),
                                    const SizedBox(width: 8),
                                    Text(widget.cartModel.size ?? ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.cartModel.product?.regularPrice.toString() ?? '',
                            style: TextStyle(
                                color: AppColors.themeColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          ProductQuantityIncDecButton(
                            onChange: (int noOfItem) {},
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
