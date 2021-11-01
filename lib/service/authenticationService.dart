import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:okbhaiya/models/businessUser.dart';

enum Status {
  // ignore: constant_identifier_names
  Undetermined,
  // ignore: constant_identifier_names
  Uninitialized,
  // ignore: constant_identifier_names
  Authenticated,
  // ignore: constant_identifier_names
  Authenticating,
  // ignore: constant_identifier_names
  Unauthenticated
}

class AuthService {
  final FirebaseAuth _firebaseAuth;
  // ignore: prefer_final_fields
  FirebaseFirestore _db = FirebaseFirestore.instance;
  AuthService(this._firebaseAuth);

  Status _status = Status.Undetermined;
  Status get status => _status;
  String userId = '';

  bool get isSignedIn => _firebaseAuth.currentUser != null;

  Stream<User?> get user => _firebaseAuth.authStateChanges().map((user) {
        if (user == null) {
          _status = Status.Unauthenticated;
          return null;
        } else {
          return user;
        }
      });

  handleStatus(User? user) async {
    if (user == null) {
      _status = Status.Uninitialized;
    } else {
      _status = Status.Authenticating;
    }
  }

  Future<Status> checkRegistration(User user) async =>
      await _db.collection('Business').doc(user.uid).get().then((snapshot) {
        if (snapshot.exists) {
          _status = Status.Authenticated;
          return _status;
        } else {
          handleStatus(user);
          return _status;
        }
      });

  Future<User> getCurrentUser() async {
    User user = _firebaseAuth.currentUser!;
    return user;
  }

  Future<void> register(BusinessUser user) async {
    return _db.collection('Business').doc(user.id).set(user.toMap());
  }

  Future signInWithOTP(verid, smsCode) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verid, smsCode: smsCode);
    try {
      UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = authResult.user;
      return user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
