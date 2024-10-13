import 'package:flutter/material.dart';
import 'product.dart';

class CatalogPage extends StatelessWidget {
  final Function toggleTheme;
  final List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'https://via.placeholder.com/150', price: 19.99),
    Product(name: 'Product 2', imageUrl: 'https://via.placeholder.com/150', price: 29.99),
    // Add more products as needed
  ];

  CatalogPage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => toggleTheme(),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} tapped!')),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}