import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_image_cubit.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_imge_cubit_state.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/screens/random_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late final MockGetRandomImageCubit mockGetRandomImageCubit;

  // Need setupAll, because the mock above can only be initialized once.
  setUpAll(() async {
    mockGetRandomImageCubit = MockGetRandomImageCubit();
    when(
      () => mockGetRandomImageCubit.getRandomImage(),
    ).thenAnswer((_) async {});
  });

  group('RandomImageScreen', () {
    testWidgets('renders correct widget', (tester) async {
      when(
        () => mockGetRandomImageCubit.state,
      ).thenReturn(GetRandomCoffeeImageInitial());
      when(
        () => mockGetRandomImageCubit.stream,
      ).thenAnswer((_) => Stream<GetCoffeeRandomImageCubitState>.empty());
      when(
        () => mockGetRandomImageCubit.getRandomImage(),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(
        BlocProvider<GetCoffeeRandomImageCubit>.value(
          value: mockGetRandomImageCubit,
          child: MaterialApp(home: RandomImageScreen()),
        ),
      );

      expect(find.byType(RandomImageScreen), findsOneWidget);
    });

    testWidgets('renders CirculuarProgressIndicator when state is loading', (
      tester,
    ) async {
      when(
        () => mockGetRandomImageCubit.state,
      ).thenReturn(const GetRandomCoffeeImageLoading());
      when(() => mockGetRandomImageCubit.stream).thenAnswer(
        (_) => Stream<GetCoffeeRandomImageCubitState>.fromIterable([
          GetRandomCoffeeImageLoading(),
        ]),
      );
      when(
        () => mockGetRandomImageCubit.getRandomImage(),
      ).thenAnswer((_) async {});
      await tester.pumpWidget(
        BlocProvider<GetCoffeeRandomImageCubit>.value(
          value: mockGetRandomImageCubit,
          child: MaterialApp(home: RandomImageScreen()),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error when state is an error', (tester) async {
      final errorMessage = 'something bad';
      when(
        () => mockGetRandomImageCubit.state,
      ).thenReturn(GetRandomCoffeeImageError(message: errorMessage));
      when(() => mockGetRandomImageCubit.stream).thenAnswer(
        (_) => Stream<GetCoffeeRandomImageCubitState>.fromIterable([
          GetRandomCoffeeImageError(message: errorMessage),
        ]),
      );
      when(
        () => mockGetRandomImageCubit.getRandomImage(),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(
        BlocProvider<GetCoffeeRandomImageCubit>.value(
          value: mockGetRandomImageCubit,
          child: MaterialApp(home: RandomImageScreen()),
        ),
      );

      expect(find.text('There was an error: something bad'), findsOneWidget);
    });
  });
}
