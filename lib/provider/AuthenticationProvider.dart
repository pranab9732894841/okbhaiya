import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:okbhaiya/service/AuthenticationService.dart';
import 'package:okbhaiya/service/DatabaseService.dart';
import 'package:okbhaiya/service/storageservice.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).user;
});

final isRegisteredProvider = FutureProvider<Status>((ref) async {
  final user = ref
      .watch(authStateProvider)
      .when(data: (data) => data, loading: () => null, error: (e, s) => null);
  return await ref.watch(authServiceProvider).checkRegistration(user!);
});

final dataProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final storageProvider = Provider<StorageService>((ref) {
  return StorageService();
});
