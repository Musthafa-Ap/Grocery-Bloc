import 'package:grocery_bloc/features/home/models/product_model.dart';

class GroceryData {
  static List<Map<String, dynamic>> groceryItems = [
    {
      'name': 'Apples',
      'category': 'Fruits',
      'price': 2.99,
      'quantity': 5,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFesMlbLt3J5HI3dejZSQfmlBtIRwECXxACg&usqp=CAU',
    },
    {
      'name': 'Milk',
      'category': 'Dairy',
      'price': 1.99,
      'quantity': 2,
      'image':
          'https://images.healthshots.com/healthshots/en/uploads/2023/01/06161102/skimmed-milk-1600x900.jpg',
    },
    {
      'name': 'Bread',
      'category': 'Bakery',
      'price': 2.49,
      'quantity': 1,
      'image':
          'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_4000,h_2250,c_limit/milk-bread.jpg',
    },
    {
      'name': 'Eggs',
      'category': 'Dairy',
      'price': 3.49,
      'quantity': 1,
      'image':
          'https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg',
    },
  ];
  static List<ProductModel> cartItems = [];
  static List<ProductModel> wishListItems = [];
}
