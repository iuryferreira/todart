abstract class UseCase<T> {
  Future<bool> execute(T data);
}
