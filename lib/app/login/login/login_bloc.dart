import 'package:bloc/bloc.dart';

enum LoginEvent { increment, decrement }

class LoginBloc extends Bloc<LoginEvent, int> {

  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(LoginEvent event) async* {
    switch (event) {
      case LoginEvent.decrement:
        yield state - 1;
        break;
      case LoginEvent.increment:
        yield state + 1;
        break;
    }
  }
}
  