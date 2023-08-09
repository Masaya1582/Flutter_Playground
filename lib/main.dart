import 'package:flutter/material.dart';

void main() {
  runApp(AddToCartAnimationApp());
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class AddToCartAnimationApp extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 10.0),
    Product('Product 2', 20.0),
    Product('Product 3', 30.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add to Cart Animation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductList(products: products),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isAddingToCart = false;

  void addToCart() {
    setState(() {
      isAddingToCart = true;
    });

    // Simulate an asynchronous process, e.g., adding to cart.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isAddingToCart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text('\$${widget.product.price.toStringAsFixed(2)}'),
      trailing: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: isAddingToCart
            ? Icon(Icons.check, color: Colors.green, key: UniqueKey())
            : ElevatedButton(
                onPressed: addToCart,
                child: Text('Add to Cart'),
              ),
      ),
    );
  }
}
