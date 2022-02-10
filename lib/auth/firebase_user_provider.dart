import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TechnoIsserFirebaseUser {
  TechnoIsserFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

TechnoIsserFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TechnoIsserFirebaseUser> technoIsserFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TechnoIsserFirebaseUser>(
        (user) => currentUser = TechnoIsserFirebaseUser(user));
