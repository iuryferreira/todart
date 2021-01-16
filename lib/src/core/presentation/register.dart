import 'package:ioco/ioco.dart';

import '../../core/shared/presenters/todo.dart';
import 'presenters/todo.dart';

void registerPresentation(Ioco container) {
  container.bind(ITodoPresenter, TodoPresenter);
}
