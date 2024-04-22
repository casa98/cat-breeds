import 'package:http/http.dart';

abstract class CatBreedInterface {
  Future<Response> getCatBreeds();
  Future<Response> searchCatBreed({required String searchText});
}
