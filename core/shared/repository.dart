import 'database.dart';

abstract class IRepository<T> {
  IDatabase connection;
  Future<bool> add(T entity);
}
