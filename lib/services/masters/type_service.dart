import 'package:bs_admin/utils/config.dart';
import 'package:bs_admin/utils/session.dart';
import 'package:http_repository/http_repository.dart';

class TypeService extends RepositoryCRUD {

  @override
  String get api => '${Config.api}/types';

  @override
  Future<String> get credentials async => 'Bearer ${await SessionUtils.get(SessionCode.token)}';
}