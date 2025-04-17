import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/models/random_coffee_image_model.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/entities/random_coffee_image_entity.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/mappers/coffee_mappers/coffee_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CoffeeMapper', () {
    test('mapToEntity returns a CoffeeEntity', () {
      final coffeeMapper = CoffeeMapperImpl();
      final coffeeEntity = coffeeMapper.mapToEntity(
        RandomCoffeeImageModel(file: 'some file'),
      );
      expect(
        coffeeEntity,
        isA<RandomCoffeeImageEntity>().having(
          (e) => e.file,
          'Verifies the file member is accurate.',
          'some file',
        ),
      );
    });
  });
}
