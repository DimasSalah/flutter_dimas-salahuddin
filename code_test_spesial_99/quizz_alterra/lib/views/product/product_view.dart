import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quizz_alterra/views/product/components/product_card.dart';

import '../add_product/controller/add_product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddProductController>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Produk'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/add-product');
                  },
                  child: Icon(Icons.add)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar Produk",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: controller.products.isEmpty
                    ? const Center(
                        child: Text(
                          "Belum ada produk",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          final product = controller.products[index];
                          return ProductCard(
                            name: product.name,
                            category: product.category,
                            price: product.price,
                            seller: product.seller,
                            sold: Random().nextInt(100),
                            icon: product.category == 'Makanan'
                                ? Icons.ramen_dining
                                : product.category == 'Minuman'
                                    ? Icons.wine_bar
                                    : Icons.tapas,
                            onTap: () {
                              controller.removeProduct(index);
                            },
                          );
                        },
                      ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/add-product');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF8b0f27),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tambah Produk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        );
  }
}
