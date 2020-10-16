import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_container/mirrors.dart';

import 'controllers/todo_controller.dart';

class Application {
  Angel app;
  AngelHttp server;

  Application() {
    this.app = Angel(reflector: MirrorsReflector());
    this.server = AngelHttp(app);
    this.routes();
  }

  startServer() async {
    await this.server.startServer('localhost', 3000);
  }

  routes() {
    this.app.configure(TodoController().configureServer);
    this.app.fallback((req, res) => throw new AngelHttpException.notFound());
  }
}
