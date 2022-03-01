part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsManageInProgress extends SettingsState {}

class SettingsManageSuccess extends SettingsState {
  final bool value;

  const SettingsManageSuccess(this.value);
}

class SettingsManageFailure extends SettingsState {
  final String message;

  const SettingsManageFailure(this.message);
}
