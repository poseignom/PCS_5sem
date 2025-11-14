import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заглушка для изображения
            Container(
              height: 120,
              width: double.infinity,
              color: AppColors.border,
              child: Icon(Icons.image, color: AppColors.textSecondary),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: AppTextStyles.price,
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