import 'package:bs_admin/utils/config.dart';
import 'package:http_repository/http_repository.dart';

class AuthService {

  String get api => '${Config.api}/auth';

  Future<Response> login({required String username, required String password}) {
    return Repository.post('$api/login', body: {'username': username, 'password': password});
  }
}