import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds/domain/models/cat_model.dart';
import 'package:catbreeds/ui/pages/cat_detail/breed_detail_page.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  const BreedCard({Key? key, required this.breed}) : super(key: key);

  final CatBreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: breed.catPhotoUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorWidget: (context, url, error) {
                return Image.asset('assets/images/cat_logo.png');
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CardText(
              text: breed.name,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CardText(text: breed.origin),
          ),
          Positioned(
            top: 0,
            right: 6,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor.withAlpha(128),
                ),
              ),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BreedDetailPage(breed: breed),
                  ),
                );
              },
              child: const Text('More...'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CardText(
              text: 'Intelligence: ${breed.intelligenceAsString}',
            ),
          ),
        ],
      ),
    );
  }
}

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return text != null
        ? ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              blendMode: BlendMode.src,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
