// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:catbreeds/domain/models/cat_model.dart';
import 'package:catbreeds/domain/services/cat_breed_interface.dart';

class CatBreedUseCase {
  final CatBreedInterface _catBreedInterface;

  CatBreedUseCase(this._catBreedInterface);

  Future<List<CatBreedModel>> getCatBreeds() async {
    final breedsResponse = await _catBreedInterface.getCatBreeds();

    if (breedsResponse.statusCode == HttpStatus.ok) {
      try {
        return listCatBreedsFromJson(breedsResponse.body);
      } catch (_) {}
    }
    return <CatBreedModel>[];
  }

  Future<List<CatBreedModel>> searchCatBreed({
    required String searchText,
  }) async {
    final breedsResponse =
        await _catBreedInterface.searchCatBreed(searchText: searchText);
    if (breedsResponse.statusCode == HttpStatus.ok) {
      try {
        return listCatBreedsFromJson(breedsResponse.body);
      } catch (_) {}
    }
    return <CatBreedModel>[];
  }
}
