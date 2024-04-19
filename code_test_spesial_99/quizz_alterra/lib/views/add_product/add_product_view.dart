
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_alterra/model/product_model.dart';

import 'controller/add_product_controller.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addProductController = Provider.of<AddProductController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nama'),
              onChanged: (value) => addProductController.setProductName(value),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
              onChanged: (value) => addProductController.setProductPrice(double.parse(value)),
            ),
            DropdownButtonFormField<String>(
              value: addProductController.selectedCategory,
              decoration: const InputDecoration(labelText: 'Kategori'),
              items: ['Makanan', 'Minuman', 'Snack']
                  .map((category) => DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              onChanged: (value) => addProductController.setSelectedCategory(value!),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Penjual'),
              onChanged: (value) => addProductController.setSellerName(value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = ProductModel(
                  name: addProductController.productName,
                  price: addProductController.productPrice.toInt(),
                  category: addProductController.selectedCategory,
                  seller: addProductController.sellerName,
                );
                addProductController.addProduct(newProduct);
                Navigator.pop(context);
                print(addProductController.products.length);
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
