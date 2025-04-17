import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/data_sources/coffee_data_source.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/repositories/coffee_repository_impl.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/mappers/coffee_mappers/coffee_mapper.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/use_cases/get_random_coffee_img_use_case.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_image_cubit.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/screens/random_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final coffeeRepository = CoffeeRepositoryImpl(
    coffeeDataSource: CoffeeDataSourceImpl(),
    coffeeMapper: CoffeeMapperImpl(),
  );

  // Regiser singletons here.
  GetIt.I.registerSingleton<GetRandomCoffeeImgUseCase>(
    GetRandomCoffeeImgUseCaseImpl(coffeeRepository: coffeeRepository),
  );
  GetIt.I.registerSingleton(http.Client());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing here and not on the screnn allows the test
      // to provide a mock implementation of the cubit.
      home: BlocProvider<GetCoffeeRandomImageCubit>(
        create: (_) => GetCoffeeRandomImageCubit()..getRandomImage(),
        child: Builder(
          builder: (context) {
            return const RandomImageScreen();
          },
        ),
      ),
    );
  }
}
