import 'package:bs_admin/utils/config.dart';
import 'package:http_repository/http_repository.dart';

class TypeService extends RepositoryCRUD {

  @override
  String get api => '${Config.api}';
}