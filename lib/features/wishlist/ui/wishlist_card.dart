import 'package:flutter/material.dart';
import 'package:grocery_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/features/home/models/product_model.dart';
import 'package:grocery_bloc/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  final WishlistBloc wishlistBloc;
  const WishlistCard(
      {super.key, required this.product, required this.wishlistBloc});

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
                  fit: BoxFit.cover, image: NetworkImage(product.image)),
              color: Colors.black,
            ),
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
                    wishlistBloc
                        .add(WishlistRemoveEvent(removingProduct: product));
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined))
            ],
          )
        ],
      ),
    );
  }
}
