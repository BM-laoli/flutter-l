import 'package:my_appls/models/user_entity.dart';

class CounterState {
  late int count;

  UserEntity? user;
  String? errorMessage;

  CounterState() {
    count = 0;
  }
}
