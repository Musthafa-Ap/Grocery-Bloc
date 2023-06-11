import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_bloc/features/wishlist/ui/wishlist_card.dart';

class WishlistScreen extends StatefulWidget {
  WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {
            if (state is WishlistRemovedActionState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Item Removed')));
            }
          },
          bloc: wishlistBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WishlistLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case WishlistSuccessState:
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistProducts.length,
                  itemBuilder: (context, index) {
                    return WishlistCard(
                        product: successState.wishlistProducts[index],
                        wishlistBloc: wishlistBloc);
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ));
  }
}
