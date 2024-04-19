import 'package:flutter/foundation.dart';
import 'package:quizz_alterra/model/product_model.dart';

class AddProductController extends ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  String _productName = '';
  double _productPrice = 0.0;
  String _selectedCategory = 'Makanan';
  String _sellerName = '';
  int _totalSold = 0;

  String get productName => _productName;
  double get productPrice => _productPrice;
  String get selectedCategory => _selectedCategory;
  String get sellerName => _sellerName;
  int get totalSold => _totalSold;

  void setProductName(String name) {
    _productName = name;
    notifyListeners();
  }

  void setProductPrice(double price) {
    _productPrice = price;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSellerName(String seller) {
    _sellerName = seller;
    notifyListeners();
  }

  void removeProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  int countProductsByCategory(String category) {
    int count = 0;
    for (var product in _products) {
      if (product.category == category) {
        count++;
      }
    }
    return count;
  }
  

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }


}
