export 'src/interfaces.dart';
import 'package:ioco/ioco.dart';
import 'src/application/register.dart';
import 'src/presentation/register.dart';
import 'src/persistence/register.dart';
import 'src/domain/register.dart';

final container = new Ioco();

setupContainer() {
  registerPersistence(container);
  registerPresentation(container);
  registerDomain(container);
  registerApplication(container);
}
