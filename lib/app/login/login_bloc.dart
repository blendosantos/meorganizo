import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meorganizo/app/login/login_repository.dart';
import 'package:meorganizo/model/Usuario.dart';
import 'package:meorganizo/shared/util.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository);

  final msgController = BehaviorSubject<String>();

  Future<Usuario> efetuarLogin(String email, String pw) async {
    Usuario user =
        await loginRepository.efetuarLogin(email, Util.generateMD5(pw));
    if (user == null) {
      msgController.add("Email/Senha inválido.");
    }
    return user;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
    msgController.close();
  }
}
