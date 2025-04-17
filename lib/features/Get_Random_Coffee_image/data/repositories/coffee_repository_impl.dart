import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/data_sources/coffee_data_source.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/exceptions/get_random_coffee_exception.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/mappers/coffee_mappers/coffee_mapper.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/repositories/coffee_repository.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  CoffeeRepositoryImpl({
    required this.coffeeDataSource,
    required this.coffeeMapper,
  });
  final CoffeeDataSource coffeeDataSource;
  final CoffeeMapper coffeeMapper;

  @override
  Future<String> getRandomCoffeeImg() async {
    try {
      final randomImageModel = await coffeeDataSource.getRandomCoffeeImage();
      // Map to Entity for Domain Layer and above.
      final randomImageEntity = coffeeMapper.mapToEntity(randomImageModel);
      return randomImageEntity.file;
    } catch (_) {
      // Can do some logging/reporting here if we wanted or in BLoC
      throw GetRandomCoffeeImageException(
        message: 'Failed to get random coffee image.',
      );
    }
  }
}
