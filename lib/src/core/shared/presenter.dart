abstract class IPresenter<T> {
  List<T> result;
  add(T data);
}

class Presenter<T> implements IPresenter<T> {
  List<T> result;

  Presenter() {
    this.result = new List<T>();
  }

  add(T data) {
    this.result.add(data);
  }
}
