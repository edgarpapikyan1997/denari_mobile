import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';

sealed class SettingsEvent {}

final class SetGpsStateEvent extends SettingsEvent {
  final bool state;

  SetGpsStateEvent(this.state);
}

final class SetNotificationsStateEvent extends SettingsEvent {
  final bool transState;
  final bool advState;

  SetNotificationsStateEvent(this.transState, this.advState);
}

sealed class SettingsState {}

final class SettingsInitialState extends SettingsState {}

final class SettingsSuccessState extends SettingsState {}

final class SettingsErrorState extends SettingsState {
  final String? error;

  SettingsErrorState(this.error);
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ProfileRepository _profileRepository;

  SettingsBloc({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(SettingsInitialState()) {
    on<SetGpsStateEvent>(_setGpsState);
    on<SetNotificationsStateEvent>(_setNotificationState);
  }

  Future<void> _setGpsState(
      SetGpsStateEvent event, Emitter<SettingsState> emit) async {
    final result = await handle(
        () async => await _profileRepository.changeGpsState(event.state));
    result.then(
      (value) =>
          value ? emit(SettingsSuccessState()) : emit(SettingsErrorState(null)),
      (error) => emit(SettingsErrorState(error)),
    );
  }

  Future<void> _setNotificationState(
      SetNotificationsStateEvent event, Emitter<SettingsState> emit) async {
    final result = await handle(() async => await _profileRepository
        .changeNotificationsState(event.transState, event.advState));
    result.then(
      (value) =>
          value ? emit(SettingsSuccessState()) : emit(SettingsErrorState(null)),
      (error) => emit(SettingsErrorState(error)),
    );
  }
}
