import 'dart:async';

import 'package:crud_sqlite_flutter/db_helper/repository.dart';
import 'package:crud_sqlite_flutter/model/User.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }
  //Save User
  SaveUser(User user) async {
    return await _repository.insertData('users', user.userMap());
  }
}
