import "dart:math";

import "package:mediboard/user/model/user.model.dart";
import "package:rxdart/rxdart.dart";

class UserRepository {
  UserRepository();

  final _random = Random();

  final _ids = ["123456", "13579", "24680"];

  final _userSubject = BehaviorSubject<User>.seeded(const User(id: "123456"));

  Stream<User> get userStream => _userSubject.stream;

  User get currentUser => _userSubject.value;

  void changeUser() {
    _userSubject.add(User(id: _ids[_random.nextInt(_ids.length)]));
  }
}
