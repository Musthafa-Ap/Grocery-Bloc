import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/cart/ui/cart.dart';
import 'package:grocery_bloc/features/home/ui/product_card.dart';
import 'package:grocery_bloc/features/wishlist/ui/wishlist.dart';

import '../bloc/home_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistScreen()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeItemWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Added to wishlist')));
        } else if (state is HomeItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Added to Cart')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text('Grocery App'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishlistButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: const Icon(Icons.shopping_bag_outlined))
                  ],
                ),
                body: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return ProductCard(
                          homeBloc: homeBloc,
                          product: successState.productsList[index]);
                    },
                    itemCount: successState.productsList.length));

          case HomeErrorState:
            return const Scaffold(
                body: Center(
              child: Text('Error'),
            ));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
