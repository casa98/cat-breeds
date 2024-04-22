import 'package:catbreeds/domain/models/cat_model.dart';
import 'package:catbreeds/domain/use_cases/cat_breed_use_case.dart';
import 'package:flutter/material.dart';

class CatBreedProvider extends ChangeNotifier {
  final CatBreedUseCase _catBreedUseCase;
  CatBreedProvider(this._catBreedUseCase);

  List<CatBreedModel> _catBreeds = [];
  List<CatBreedModel> get catBreeds => _catBreeds;

  bool loading = true;
  bool searching = false;

  void getCatBreeds() async {
    loading = true;
    searching = false;
    notifyListeners();

    _catBreeds = await _catBreedUseCase.getCatBreeds();
    loading = false;
    notifyListeners();
  }

  void searchCatBreed({required String searchText}) async {
    loading = true;
    searching = true;
    notifyListeners();

    _catBreeds = await _catBreedUseCase.searchCatBreed(
      searchText: searchText,
    );
    loading = false;
    notifyListeners();
  }

  Map<String, String?> getDetailProperties(CatBreedModel breed) {
    return {
      'Origin': breed.origin,
      'Intelligence level': breed.intelligenceAsString,
      'Lifespan': '${breed.lifeSpan} years',
      'Energy level': '${(breed.energyLevel ?? 0).toString()}/5',
      'Adaptability': '${(breed.adaptability ?? 0).toString()}/5',
      'Temperament': breed.temperament,
      'Alternative names': breed.altNames,
    };
  }
}
