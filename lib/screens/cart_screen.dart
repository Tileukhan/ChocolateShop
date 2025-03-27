import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';
import '../services/notification_service.dart';
import '../widgets/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  Future<void> _simulateCheckout(
    double totalPrice,
    BuildContext context,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('orders').add({
          'userId': user.uid,
          'total': totalPrice,
          'timestamp': FieldValue.serverTimestamp(),
          'userToken': await NotificationService().getToken(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Checkout simulated! Check Firebase for notification.',
            ),
          ),
        );
        Provider.of<CartProvider>(context, listen: false).cartItems.clear();

        final token = await NotificationService().getToken();
        print('User FCM Token: $token');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Chocolate Shop'),
      body:
          cart.cartItems.isEmpty
              ? const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    color: Color(0xFF757575),
                  ),
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cart.cartItems[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product.imageUrl,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.broken_image,
                                              size: 60,
                                              color: Colors.grey,
                                            ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.headlineSmall,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Color(0xFFF4A261),
                                  ),
                                  onPressed: () {
                                    cart.removeFromCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.name} removed from cart',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF4A261),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed:
                              () => _simulateCheckout(cart.totalPrice, context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF4A261),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'Checkout (Test)',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
