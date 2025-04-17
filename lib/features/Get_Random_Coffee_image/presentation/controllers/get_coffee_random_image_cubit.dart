import 'package:coffee_vgv/features/Get_Random_Coffee_image/domain/use_cases/get_random_coffee_img_use_case.dart';
import 'package:coffee_vgv/features/Get_Random_Coffee_image/presentation/controllers/get_coffee_random_imge_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GetCoffeeRandomImageCubit extends Cubit<GetCoffeeRandomImageCubitState> {
  GetCoffeeRandomImageCubit() : super(const GetRandomCoffeeImageInitial());

  Future<void> getRandomImage() async {
    emit(const GetRandomCoffeeImageLoading());

    final useCase = GetIt.I<GetRandomCoffeeImgUseCase>();

    try {
      final file = await useCase();
      emit(GetRandomCoffeeImageLoaded(file: file));
      // Could get StackTrace to include more details for reporting sake.
    } catch (e) {
      emit(GetRandomCoffeeImageError(message: 'Failed to GetRandomImage'));
    }
  }
}
