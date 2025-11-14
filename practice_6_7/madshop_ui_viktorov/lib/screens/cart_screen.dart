import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Временные данные корзины
    final cartItems = [
      {'title': 'iPhone 14 Pro', 'price': '\$999', 'quantity': '1'},
      {'title': 'AirPods Pro', 'price': '\$249', 'quantity': '1'},
    ];

    double total = 0;
    for (var item in cartItems) {
      total += double.parse(item['price']!.replaceAll('\$', ''));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart', style: AppTextStyles.titleLarge),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: AppColors.border,
                      child: const Icon(Icons.image, color: AppColors.textSecondary),
                    ),
                    title: Text(cartItems[index]['title']!, style: AppTextStyles.bodyLarge),
                    subtitle: Text(cartItems[index]['price']!, style: AppTextStyles.price),
                    trailing: Text('Qty: ${cartItems[index]['quantity']}', style: AppTextStyles.bodyMedium),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: AppTextStyles.titleMedium),
                Text('\$${total.toStringAsFixed(2)}', style: AppTextStyles.price),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Действие при оформлении заказа
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order placed successfully!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}