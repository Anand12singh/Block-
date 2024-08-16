import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  const FavouriteItemModel(
      {required this.id,
      required this.value,
      this.ischeck = false,
      this.isfavouirt = false});

  final String id;
  final String value;
  final bool ischeck;
  final bool isfavouirt;

  @override
  List<Object?> get props => [id, value, ischeck, isfavouirt];

  FavouriteItemModel copyWith(
      {String? id, String? value, bool? ischeck, bool? isfavouirt}) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        ischeck: ischeck ?? this.ischeck,
        isfavouirt: this.isfavouirt);
  }
}
