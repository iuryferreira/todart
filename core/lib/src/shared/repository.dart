import 'database.dart';
import 'errors.dart';

abstract class IRepository<T> {
  IDatabase connection;
  Errors errors;
  Future<bool> add(T entity);
}
