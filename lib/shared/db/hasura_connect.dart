import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HasuraConnectRepository extends Disposable {

  HasuraConnect hasuraConnect;

  HasuraConnectRepository(){
    String url = "https://me-organizo.herokuapp.com/v1/graphql";
    this.hasuraConnect = HasuraConnect(url);
  }

  //dispose will be called automatically
  @override
  void dispose() {
    
  }

}
  