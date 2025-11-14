import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'product_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Временные данные для демонстрации
    final products = [
      {'title': 'iPhone 14 Pro', 'price': '\$999'},
      {'title': 'Samsung Galaxy S23', 'price': '\$849'},
      {'title': 'Google Pixel 7', 'price': '\$599'},
      {'title': 'OnePlus 11', 'price': '\$699'},
      {'title': 'Xiaomi 13', 'price': '\$749'},
      {'title': 'MacBook Air M2', 'price': '\$1199'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('MAD Shop', style: AppTextStyles.titleLarge),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            title: products[index]['title']!,
            price: products[index]['price']!,
            imageUrl: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    productName: products[index]['title']!,
                    productPrice: products[index]['price']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}