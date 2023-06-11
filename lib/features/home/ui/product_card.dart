import 'package:flutter/material.dart';
import 'package:grocery_bloc/data/grocery_data.dart';
import 'package:grocery_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/features/home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final HomeBloc homeBloc;
  const ProductCard({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(product.image))),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontSize: 18),
          ),
          Row(
            children: [
              Text('Rs ${product.price}'),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        product: product));
                  },
                  icon: const Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(
                        HomeProductCardButtonClickedEvent(product: product));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))
            ],
          )
        ],
      ),
    );
  }
}
