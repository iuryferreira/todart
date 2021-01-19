export 'src/interfaces.dart';
import 'package:ioco/ioco.dart';
import 'src/application/register.dart';
import 'src/persistence/register.dart';
import 'src/domain/register.dart';

final container = Ioco();

setupContainer() {
  registerPersistence(container);
  registerDomain(container);
  registerApplication(container);
}
