import 'package:mobx/mobx.dart';

import '../../data/user_finder/repository/user_finder_repository.dart';
import '../../utils/network/utils/use_case.dart';

part 'user_finder_state.g.dart';

class UserFinderState = ImplUserFinderState with _$UserFinderState;

abstract class ImplUserFinderState with Store {
  final UserFinderRepository _userFinderRepository;

  ImplUserFinderState({
    required UserFinderRepository userFinderRepository,
  }) : _userFinderRepository = userFinderRepository;

  @observable
  String? contactInfoError;

  @observable
  bool contactExist = false;

  @action
  Future<void> findUser(String contactInfo) async {
    (await handle(() => _userFinderRepository.findUser(contactInfo))).then(
      (data) {
        contactExist = data;
      },
      (error) => contactInfoError = error,
    );
  }
}
