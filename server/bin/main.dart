import 'package:dotenv/dotenv.dart';
import 'package:todart_server/server.dart';

Application app;

main() async {
  load();
  app = Application();
  await app.startServer();
}
