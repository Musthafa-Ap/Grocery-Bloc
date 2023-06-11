import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc/data/grocery_data.dart';
import 'package:grocery_bloc/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCardButtonClickedEvent>(homecartWishlistButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    if (!GroceryData.wishListItems.contains(event.product)) {
      GroceryData.wishListItems.add(event.product);
      emit(HomeItemWishListedActionState());
    } else {
      print('Already added');
    }
  }

  FutureOr<void> homecartWishlistButtonClickedEvent(
      HomeProductCardButtonClickedEvent event, Emitter<HomeState> emit) {
    GroceryData.cartItems.add(event.product);
    emit(HomeItemCartedActionState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        productsList: GroceryData.groceryItems
            .map((e) => ProductModel(
                name: e['name'],
                category: e['category'],
                price: e['price'],
                quantity: e['quantity'],
                image: e['image']))
            .toList()));
  }
}
