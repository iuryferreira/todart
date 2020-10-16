import 'package:dotenv/dotenv.dart';

import 'server/app.dart';

main() async {
  load();
  var app = Application();
  await app.startServer();
}
