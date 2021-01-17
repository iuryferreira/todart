import 'database.dart';
import 'errors.dart';

abstract class IRepository {
  IDatabase connection;
  Errors errors;
}
