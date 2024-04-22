import 'package:catbreeds/domain/providers/cat_breed_provider.dart';
import 'package:flutter/material.dart';

class BreedSearchBar extends StatelessWidget {
  const BreedSearchBar({
    required final CatBreedProvider catBreedProvider,
    required final TextEditingController searchController,
    super.key,
  })  : _catBreedProvider = catBreedProvider,
        _controller = searchController;

  final CatBreedProvider _catBreedProvider;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search breed',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: () => _onTap(),
            child: _catBreedProvider.searching
                ? const Icon(Icons.close)
                : const Icon(Icons.search),
          ),
        ),
        onFieldSubmitted: (value) => _onTap(),
      ),
    );
  }

  void _onTap() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_catBreedProvider.searching) {
      _catBreedProvider.getCatBreeds();
      _controller.clear();
    } else if (_controller.text.trim().isNotEmpty) {
      _catBreedProvider.searchCatBreed(
        searchText: _controller.text,
      );
    }
  }
}
