import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc/data/grocery_data.dart';
import 'package:grocery_bloc/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(WishlistSuccessState(wishlistProducts: GroceryData.wishListItems));
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEvent event, Emitter<WishlistState> emit) {
    GroceryData.wishListItems.remove(event.removingProduct);
    emit(WishlistSuccessState(wishlistProducts: GroceryData.wishListItems));
    emit(WishlistRemovedActionState());
  }
}
