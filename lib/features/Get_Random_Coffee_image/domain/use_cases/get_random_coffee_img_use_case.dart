import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/repositories/coffee_repository.dart';

abstract interface class GetRandomCoffeeImgUseCase {
  Future<String> call();
}

class GetRandomCoffeeImgUseCaseImpl implements GetRandomCoffeeImgUseCase {
  GetRandomCoffeeImgUseCaseImpl({required this.coffeeRepository});
  final CoffeeRepository coffeeRepository;

  @override
  Future<String> call() async {
    // All Business Logic belongs here.
    final result = await coffeeRepository.getRandomCoffeeImg();
    return result;
  }
}
