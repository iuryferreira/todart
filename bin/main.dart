import 'package:dotenv/dotenv.dart';
import 'package:todart/todart.dart';

Application app;

main() async {
  load();
  app = Application();
  await app.startServer();
}
