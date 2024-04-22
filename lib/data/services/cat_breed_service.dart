import 'package:catbreeds/domain/services/cat_breed_interface.dart';
import 'package:catbreeds/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class CatBreedService extends CatBreedInterface {
  @override
  Future<http.Response> getCatBreeds() {
    final url = Uri.parse(getCatBreedsUrl);
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
    };
    return http.get(url, headers: headers);
  }

  @override
  Future<http.Response> searchCatBreed({required String searchText}) {
    final queryParams = {'q': searchText};
    final url = Uri.parse(searchCatBreedUrl).replace(
      queryParameters: queryParams,
    );
    final headers = {
      'Content-Type': 'application/json',
      'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
    };
    return http.get(url, headers: headers);
  }
}
