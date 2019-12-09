import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:meorganizo/model/Usuario.dart';

class LoginRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  LoginRepository(this.hasuraConnect);

  Future<Usuario> efetuarLogin(String email, String pw) async {
    String docQuery = """ 
      query {
        usuarios(where: {email: {_eq: "$email"}, password: {_eq: "$pw"}}) {
          id
          nome
          email
          path_foto
        }
      }
     """;

    var result = await hasuraConnect.query(docQuery);
    Usuario user;
    (result["data"]["usuarios"] as List).forEach((item) {
      user = Usuario.fromJson(item);
    });
    return user;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
