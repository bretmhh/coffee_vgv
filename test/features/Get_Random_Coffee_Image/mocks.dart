import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/data_sources/coffee_data_source.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/repositories/coffee_repository.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/use_cases/get_random_coffee_img_use_case.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_image_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

//Cubits/Blocs
class MockGetRandomImageCubit extends Mock
    implements GetCoffeeRandomImageCubit {}

//Repos
class MockCoffeeRepository extends Mock implements CoffeeRepository {}

//Datasources
class MockCoffeeDataSource extends Mock implements CoffeeDataSource {}

// Usecases
class MockGetRandomImageUsecase extends Mock
    implements GetRandomCoffeeImgUseCase {}

class MockHttpClient extends Mock implements http.Client {}
