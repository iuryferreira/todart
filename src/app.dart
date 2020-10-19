import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_container/mirrors.dart';
import 'controllers/todo_controller.dart';

class Application {
  Angel app;
  AngelHttp server;
  Application() {
    this.createApp();
  }

  startServer() async {
    this.server = AngelHttp(app);
    await this.server.startServer('localhost', 3000);
  }

  createApp() {
    this.app = Angel(reflector: MirrorsReflector());
    this.addRoutes();
  }

  addRoutes() {
    this.app.configure(TodoController().configureServer);
    this.app.fallback((req, res) => throw new AngelHttpException.notFound());
  }
}
