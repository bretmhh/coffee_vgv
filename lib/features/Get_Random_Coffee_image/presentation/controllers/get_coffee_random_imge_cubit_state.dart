import 'package:equatable/equatable.dart';

sealed class GetCoffeeRandomImageCubitState extends Equatable {
  const GetCoffeeRandomImageCubitState();

  @override
  List<Object?> get props => [];
}

class GetRandomCoffeeImageInitial extends GetCoffeeRandomImageCubitState {
  const GetRandomCoffeeImageInitial();
}

class GetRandomCoffeeImageLoading extends GetCoffeeRandomImageCubitState {
  const GetRandomCoffeeImageLoading();
}

class GetRandomCoffeeImageError extends GetCoffeeRandomImageCubitState {
  final String message;
  const GetRandomCoffeeImageError({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetRandomCoffeeImageLoaded extends GetCoffeeRandomImageCubitState {
  final String file;
  const GetRandomCoffeeImageLoaded({required this.file});

  @override
  List<Object?> get props => [file];
}
