import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/dummy_data.dart';
import 'package:flutter_movies_app_ex/data/models/market_model.dart';
import 'package:flutter_movies_app_ex/screens/home_screen.dart';

class ClothesRepository extends ChangeNotifier {
  // List<Clothes> clothesList = [];

  addClothes(int id, String name, String imageUrl, String description,
      String size, double price) {
    Clothes clothes = Clothes(
        id: id,
        name: name,
        imageUrl: imageUrl,
        description: description,
        size: size,
        price: price);
    clothesList.add(clothes);
    DUMMY_DATA.add(clothes);
    notifyListeners();
  }

  removeClothes(int id) {
    print(id);
    clothesList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editClothes(Clothes clothes, int index) {
    clothesList.replaceRange(index, index + 1, [clothes]);
    notifyListeners();
  }
}
