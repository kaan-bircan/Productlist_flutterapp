import 'package:flutter/material.dart';
import 'package:product_list/model/product.dart';
import 'package:product_list/model/products.dart';
import 'package:product_list/template/productitemtemplate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Product List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Color.fromARGB(255, 255, 255, 255)),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          children: productsList.map((p) => productCard(p, context)).toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                String newproduct_name = "";
                double newproduct_price = 0;
                double newproduct_discount = 0.0;
                String? newproduct_image;

                return AlertDialog(
                  title: Text("Add Product"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            newproduct_name = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            newproduct_price = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            newproduct_discount = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Discount',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            newproduct_image = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Image',
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Create a Product object with the entered information
                        Product newProduct = Product(
                            name: newproduct_name,
                            price: newproduct_price,
                            discount: newproduct_discount,
                            image: newproduct_image);
                        // Add your logic to handle the new product object here
                        setState(() {
                          productsList.add(newProduct);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                );
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
