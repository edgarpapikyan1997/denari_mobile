import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:denari_app/data/advertisements/model/advertisement_model.dart';
import 'package:denari_app/data/advertisements/repository/advertisements_repository.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';

sealed class AdvertisementsEvent {}

final class AdvertisementsFetchEvent extends AdvertisementsEvent {}

sealed class AdvertisementsState {
  final List<AdvertisementModel> items;

  AdvertisementsState({required this.items});
}

final class AdvertisementsInitial extends AdvertisementsState {
  AdvertisementsInitial() : super(items: const []);
}

final class AdvertisementsFetchedState extends AdvertisementsState {
  AdvertisementsFetchedState({required super.items});
}

final class AdvertisementsErrorState extends AdvertisementsState {
  final String? error;

  AdvertisementsErrorState(this.error) : super(items: const []);
}

class AdvertisementsBloc
    extends Bloc<AdvertisementsEvent, AdvertisementsState> {
  final AdvertisementsRepository _repository;

  AdvertisementsBloc({required final AdvertisementsRepository repository})
      : _repository = repository,
        super(AdvertisementsInitial()) {
    on<AdvertisementsFetchEvent>(_fetchAdvertisement);
  }

  Future<void> _fetchAdvertisement(AdvertisementsFetchEvent event,
      Emitter<AdvertisementsState> emit) async {
    (await handle(() => _repository.getAdvertisements())).then(
          (data) => emit(AdvertisementsFetchedState(items: data)),
          (error) => emit(AdvertisementsErrorState(error)),
    );
  }
}
