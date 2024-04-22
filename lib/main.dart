import 'package:catbreeds/data/services/cat_breed_service.dart';
import 'package:catbreeds/domain/providers/cat_breed_provider.dart';
import 'package:catbreeds/domain/use_cases/cat_breed_use_case.dart';
import 'package:catbreeds/ui/pages/cats_page/breeds_page.dart';
import 'package:catbreeds/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final catBreedRepository = CatBreedService();
  final catBreedUseCase = CatBreedUseCase(catBreedRepository);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      ChangeNotifierProvider(
        create: (_) => CatBreedProvider(catBreedUseCase),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds App',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          const Color.fromARGB(255, 235, 83, 36),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Breeds'),
        ),
        body: const BreedsPage(),
      ),
    );
  }
}
