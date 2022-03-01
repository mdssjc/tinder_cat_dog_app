import 'package:bloc/bloc.dart';
import 'package:dog/dog.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/core/data/repositories/settings_repository_impl.dart';
import 'package:tinder_cat_dog_app/core/domain/entities/animal_type.dart';
import 'package:tinder_cat_dog_app/core/domain/usecases/manage_settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  late final ManageSettings manageSettings;

  SettingsCubit() : super(SettingsInitial()) {
    manageSettings = ManageSettings(SettingsRepositoryImpl());
  }

  void init() {
    emit(SettingsManageInProgress());
    Future.microtask(() {
      emit(SettingsManageSuccess(manageSettings.getType() == AnimalType.dog));
    });
  }

  void choose(bool value) {
    emit(SettingsManageInProgress());
    Future.microtask(() {
      emit(SettingsManageSuccess(value));
    });
  }

  void save(bool value) {
    Future.microtask(() {
      try {
        manageSettings.saveType(value ? AnimalType.dog : AnimalType.cat);
      } catch (exception) {
        dog.e(errorServerMessage);
        emit(const SettingsManageFailure(errorServerMessage));
      }
    });
  }
}
