import 'package:angel_framework/angel_framework.dart';

Future<bool> deserialize(RequestContext req, res) async {
  await req.parseBody();
  return true;
}
