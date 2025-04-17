import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_image_cubit.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_imge_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomImageScreen extends StatelessWidget {
  const RandomImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<
          GetCoffeeRandomImageCubit,
          GetCoffeeRandomImageCubitState
        >(
          builder: (context, state) {
            return Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  switch (state) {
                    GetRandomCoffeeImageInitial() => const SizedBox.shrink(),
                    GetRandomCoffeeImageLoading() =>
                      const CircularProgressIndicator(),
                    GetRandomCoffeeImageLoaded(:final file) => Image.network(
                      file,
                    ),
                    GetRandomCoffeeImageError(:final message) => Text(
                      'There was an error: $message',
                    ),
                  },
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed:
                    // Could make this button disabled when in LoadingState.
                    () =>
                        context
                            .read<GetCoffeeRandomImageCubit>()
                            .getRandomImage(),
                child: const Icon(Icons.refresh),
              ),
            );
          },
        );
      },
    );
  }
}
