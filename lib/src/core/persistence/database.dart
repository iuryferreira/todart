import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/firedart.dart';
import 'package:dotenv/dotenv.dart';

import '../shared/database.dart';

class Database implements IDatabase {
  FirebaseAuth auth;
  Firestore firestore;

  Database() {
    FirebaseAuth.initialize(env['API_KEY'], VolatileStore());
    Firestore.initialize(env['PROJECT_ID']);
    this.auth = FirebaseAuth.instance;
    this.firestore = Firestore.instance;
    this._signIn();
  }
  _signIn() async {
    await this.auth.signIn(env['EMAIL'], env['PASSWORD']);
  }
}
