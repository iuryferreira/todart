import 'presenter.dart';
import 'repository.dart';

abstract class UseCase<T> {
  IPresenter<T> presenter;
  IRepository<T> repository;
  Future<bool> execute(T data);
}
