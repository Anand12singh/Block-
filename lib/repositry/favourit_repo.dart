import '../model/favourite_model.dart';

class FavouritRepo {
  Future<List<FavouriteItemModel>> fatchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(generateList(10));
  }

  List<FavouriteItemModel> generateList(int length) {
    return List.generate(
      length,
      (index) =>
          FavouriteItemModel(id: index.toString(), value: "Item  $index"),
    );
  }
}
