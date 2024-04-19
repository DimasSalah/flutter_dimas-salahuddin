import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_product/controller/add_product_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddProductController>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                child: Text(controller.products.length.toString()),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Produk',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Makanan: ${controller.countProductsByCategory("Makanan")} | ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Miniman: ${controller.countProductsByCategory("Minuman")} | ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Snack: ${controller.countProductsByCategory("Snack")}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
