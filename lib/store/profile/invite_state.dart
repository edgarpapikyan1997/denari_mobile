import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:mobx/mobx.dart';

part 'invite_state.g.dart';

class InviteState = ImplInviteState with _$InviteState;

abstract class ImplInviteState with Store {
  final ProfileRepository _repository;

  ImplInviteState({
    required ProfileRepository profileRepository,
  }) : _repository = profileRepository;

  @observable
  String? inviteError;

  @observable
  String contact = "";

  @action
  void setContact(String value) => contact = value;

  @observable
  bool loading = false;

  @computed
  bool get isContactValid => contact.isNotEmpty;

  @computed
  bool get inviteButtonEnabled => isContactValid && !loading;

  @action
  Future<void> invite() async {
    loading = true;
    (await handle(() => _repository.invite(contact))).then(
      (data) => inviteError = 'true',
      (error) => inviteError = error,
    );
    loading = false;
  }
}
