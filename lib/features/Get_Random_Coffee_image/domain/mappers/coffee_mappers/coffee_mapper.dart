// Mapper for Serializable Models to Domain Entities, vice versa.
import 'package:coffee_vgv/features/Get_Random_Coffee_image/data/models/random_coffee_image_model.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/entities/random_coffee_image_entity.dart';

abstract interface class CoffeeMapper {
  RandomCoffeeImageEntity mapToEntity(RandomCoffeeImageModel model);
}

class CoffeeMapperImpl implements CoffeeMapper {
  @override
  RandomCoffeeImageEntity mapToEntity(RandomCoffeeImageModel model) =>
      RandomCoffeeImageEntity(file: model.file);
}
