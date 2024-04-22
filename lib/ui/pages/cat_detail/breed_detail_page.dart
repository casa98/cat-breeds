import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/domain/models/cat_model.dart';
import 'package:catbreeds/domain/providers/cat_breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/attribute_value_widget.dart';

class BreedDetailPage extends StatelessWidget {
  const BreedDetailPage({
    super.key,
    required this.breed,
  });

  final CatBreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name ?? ''),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    breed.catPhotoUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12.0),
                  Text(breed.description ?? ''),
                  const SizedBox(height: 12.0),
                  AttributeValueWidget(
                    properties: context
                        .read<CatBreedProvider>()
                        .getDetailProperties(breed),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
