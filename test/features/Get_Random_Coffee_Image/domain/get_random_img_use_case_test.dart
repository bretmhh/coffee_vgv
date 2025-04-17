import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/exceptions/get_random_coffee_exception.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/use_cases/get_random_coffee_img_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  group('GetRnadomCoffeeImageUseCase', () {
    test(
      'throws GetRandomCoffeeImageException when coffeeRepository throws GetRandomCoffeeImageException',
      () {
        final mockCoffeeRepository = MockCoffeeRepository();
        when(() => mockCoffeeRepository.getRandomCoffeeImg()).thenThrow(
          GetRandomCoffeeImageException(
            message: 'Failed to get random coffee image.',
          ),
        );
        final useCase = GetRandomCoffeeImgUseCaseImpl(
          coffeeRepository: mockCoffeeRepository,
        );

        expect(useCase.call(), throwsA(isA<GetRandomCoffeeImageException>()));
      },
    );

    test('return a String to network file when successful', () async {
      final mockCoffeeRepository = MockCoffeeRepository();
      when(
        () => mockCoffeeRepository.getRandomCoffeeImg(),
      ).thenAnswer((_) async => 'some file');
      final useCase = GetRandomCoffeeImgUseCaseImpl(
        coffeeRepository: mockCoffeeRepository,
      );

      final result = await useCase.call();

      expect(result, 'some file');
    });
  });
}
