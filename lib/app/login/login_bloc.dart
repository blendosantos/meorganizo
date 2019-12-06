import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meorganizo/app/login/login_repository.dart';

class LoginBloc extends BlocBase {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository);

  Future<dynamic> efetuarLogin(String email, String pw) async {
    return loginRepository.efetuarLogin(email, pw);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
