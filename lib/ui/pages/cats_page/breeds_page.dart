import 'package:catbreeds/domain/providers/cat_breed_provider.dart';
import 'package:catbreeds/ui/pages/cats_page/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/breed_search_bar.dart';

class BreedsPage extends StatefulWidget {
  const BreedsPage({super.key});

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  late final CatBreedProvider _catBreedProvder;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _catBreedProvder = context.read();
    _catBreedProvder.getCatBreeds();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Consumer<CatBreedProvider>(
          builder: (context, catBreedProvider, child) {
            if (catBreedProvider.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (catBreedProvider.catBreeds.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('No breeds found'),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _searchController.clear();
                        _catBreedProvder.getCatBreeds();
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                BreedSearchBar(
                  catBreedProvider: _catBreedProvder,
                  searchController: _searchController,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: catBreedProvider.catBreeds.length,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final breed = catBreedProvider.catBreeds[index];
                      return BreedCard(breed: breed);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
