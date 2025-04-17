// I would prefer to use Freezed here with the Serializable behavior.
// Although, I did not want to add dependency overrides.
class RandomCoffeeImageModel {
  const RandomCoffeeImageModel({required this.file});
  final String file;

  factory RandomCoffeeImageModel.fromJson(Map<String, dynamic> json) {
    return RandomCoffeeImageModel(file: json['file']);
  }
}
