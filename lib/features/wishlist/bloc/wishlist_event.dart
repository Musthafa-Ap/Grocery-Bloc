part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveEvent extends WishlistEvent {
  final ProductModel removingProduct;

  WishlistRemoveEvent({required this.removingProduct});
}
