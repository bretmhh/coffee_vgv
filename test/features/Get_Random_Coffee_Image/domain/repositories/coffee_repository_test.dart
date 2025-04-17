import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/models/random_coffee_image_model.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/repositories/coffee_repository_impl.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/exceptions/get_random_coffee_exception.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/mappers/coffee_mappers/coffee_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group('CoffeeRepository', () {
    test('getRandomCoffeeImg returns a String when successful', () async {
      final mockCoffeeDataSource = MockCoffeeDataSource();
      when(
        () => mockCoffeeDataSource.getRandomCoffeeImage(),
      ).thenAnswer((_) async => RandomCoffeeImageModel(file: 'some file'));
      final repository = CoffeeRepositoryImpl(
        coffeeDataSource: mockCoffeeDataSource,
        coffeeMapper: CoffeeMapperImpl(),
      );
      final result = await repository.getRandomCoffeeImg();
      expect(result, 'some file');
    });

    test(
      'getRandomCoffeeImg throws GetRandomCoffeeImageException when unsuccessful',
      () async {
        final mockCoffeeDataSource = MockCoffeeDataSource();
        when(
          () => mockCoffeeDataSource.getRandomCoffeeImage(),
        ).thenThrow(GetRandomCoffeeImageException(message: 'some error'));
        final repository = CoffeeRepositoryImpl(
          coffeeDataSource: mockCoffeeDataSource,
          coffeeMapper: CoffeeMapperImpl(),
        );
        expect(
          repository.getRandomCoffeeImg(),
          throwsA(
            isA<GetRandomCoffeeImageException>().having(
              (e) => e.message,
              // We can always include more details for reporting sake.
              'Error message from exception.',
              'Failed to get random coffee image.',
            ),
          ),
        );
      },
    );
  });
}
