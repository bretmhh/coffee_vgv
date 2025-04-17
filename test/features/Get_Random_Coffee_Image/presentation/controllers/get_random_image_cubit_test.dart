import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/use_cases/get_random_coffee_img_use_case.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_image_cubit.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_imge_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late final MockGetRandomImageUsecase mockGetRandomCoffeeImgUseCase;
  late GetCoffeeRandomImageCubit cubit;

  setUpAll(() {
    mockGetRandomCoffeeImgUseCase = MockGetRandomImageUsecase();
    GetIt.I.registerSingleton<GetRandomCoffeeImgUseCase>(
      mockGetRandomCoffeeImgUseCase,
    );
    cubit = GetCoffeeRandomImageCubit();
  });

  test('initial state is GetRandomImageInitial', () {
    expect(cubit.state, const GetRandomCoffeeImageInitial());
  });

  blocTest(
    'getRandomImage emits GetRandomCoffeeImageLoading and GetRandomCoffeeImageLoaded when getRancdomImage is called',
    build: () {
      when(() => mockGetRandomCoffeeImgUseCase()).thenAnswer((_) async => '');
      return GetCoffeeRandomImageCubit();
    },
    act: (cubit) async => await cubit.getRandomImage(),
    expect:
        () => const [
          GetRandomCoffeeImageLoading(),
          GetRandomCoffeeImageLoaded(file: ''),
        ],
  );

  blocTest(
    'getRandomImage emits GetRandomCoffeeImageError when getRancdomImage is called',
    build: () {
      when(() => mockGetRandomCoffeeImgUseCase()).thenThrow(Exception());
      return GetCoffeeRandomImageCubit();
    },
    act: (cubit) async => await cubit.getRandomImage(),
    expect:
        () => const [
          GetRandomCoffeeImageLoading(),
          GetRandomCoffeeImageError(message: 'Failed to GetRandomImage'),
        ],
  );
}
