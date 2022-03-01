import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/features/animals/data/repositories/animal_repository_impl.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/usecases/get_animal.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  late final GetAnimal getAnimal;

  AnimalCubit() : super(AnimalInitial()) {
    getAnimal = GetAnimal(AnimalRepositoryImpl());
  }

  void init() => emit(AnimalInitial());

  void refresh() {
    emit(AnimalLoadInProgress());
    Future.microtask(() async {
      emit(AnimalLoadSuccess(await getAnimal.listAll().catchError((error) {
        emit(const AnimalLoadInFailure(errorServerMessage));
      })));
    });
  }
}
