import 'dart:convert';

import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/models/random_coffee_image_model.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/exceptions/get_random_coffee_exception.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

abstract class CoffeeDataSource {
  Future<RandomCoffeeImageModel> getRandomCoffeeImage();
}

class CoffeeDataSourceImpl implements CoffeeDataSource {
  @override
  Future<RandomCoffeeImageModel> getRandomCoffeeImage({
    String url = "https://coffee.alexflipnote.dev/random.json",
  }) async {
    final client = GetIt.I<http.Client>();
    final response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw GetRandomCoffeeImageException(
        message: 'Failed to load random coffee image',
      );
    }
    final json = response.body;
    final decodedJson = jsonDecode(json);
    final model = RandomCoffeeImageModel.fromJson(decodedJson);
    return model;
  }
}
