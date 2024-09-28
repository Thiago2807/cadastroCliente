import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool visiblePassword = false;

  @action
  alterVisiblePassword() {
    if (visiblePassword) {
      visiblePassword = false;
    }
    else {
      visiblePassword = true;
    }
  }

}