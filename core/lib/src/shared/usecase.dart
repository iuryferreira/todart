abstract class UseCase<T> {
  Future<T> execute(T data);
}
