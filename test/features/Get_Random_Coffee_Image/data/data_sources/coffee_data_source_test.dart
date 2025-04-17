import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/data_sources/coffee_data_source.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/models/random_coffee_image_model.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/exceptions/get_random_coffee_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('CoffeeDataSource', () {
    late MockHttpClient mockHttpClient;
    setUpAll(() {
      registerFallbackValue(Uri.parse('some uri'));
      mockHttpClient = MockHttpClient();
      GetIt.I.registerSingleton<http.Client>(mockHttpClient);
    });

    test(
      'getRandomCoffeeImage returns a RandomCoffeeImageModel when successful',
      () async {
        when(
          () => mockHttpClient.get(any()),
        ).thenAnswer((_) async => http.Response('{"file": "some file"}', 200));
        final coffeeDataSource = CoffeeDataSourceImpl();
        final result = await coffeeDataSource.getRandomCoffeeImage();
        expect(result, isA<RandomCoffeeImageModel>());
      },
    );

    test(
      'getRandomCoffeeImage throws GetRandomCoffeeImageException when unsuccessful',
      () async {
        when(
          () => mockHttpClient.get(any()),
        ).thenAnswer((_) async => http.Response('{"file": "some file"}', 404));
        final coffeeDataSource = CoffeeDataSourceImpl();
        expect(
          coffeeDataSource.getRandomCoffeeImage(),
          throwsA(
            isA<GetRandomCoffeeImageException>().having(
              (e) => e.message,
              'Verifies the message member is accurate.',
              'Failed to load random coffee image',
            ),
          ),
        );
      },
    );
  });
}
