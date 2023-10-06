import 'package:amazon_clone/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      type: '',
      address: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    emit(state);
  }
}
