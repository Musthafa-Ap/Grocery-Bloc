part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel product;

  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeProductCardButtonClickedEvent extends HomeEvent {
  final ProductModel product;
  HomeProductCardButtonClickedEvent({required this.product});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
