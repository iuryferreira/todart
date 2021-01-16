import 'package:ioco/ioco.dart';

import '../core/application/register.dart';
import '../core/presentation/register.dart';
import '../core/persistence/register.dart';
import '../core/domain/register.dart';

final container = new Ioco();

setupContainer() {
  registerPersistence(container);
  registerPresentation(container);
  registerDomain(container);
  registerApplication(container);
}
