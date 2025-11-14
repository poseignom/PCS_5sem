import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class ProductScreen extends StatelessWidget {
  final String productName;
  final String productPrice;

  const ProductScreen({
    Key? key,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: AppTextStyles.titleLarge),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Изображение товара
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.border,
              child: const Icon(Icons.image, size: 100, color: AppColors.textSecondary),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: AppTextStyles.titleLarge),
                  const SizedBox(height: 8),
                  Text(productPrice, style: AppTextStyles.price),
                  const SizedBox(height: 16),
                  const Text(
                    'Product description goes here. This is a detailed description of the product features, specifications, and benefits.',
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Действие при добавлении в корзину
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product added to cart!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}