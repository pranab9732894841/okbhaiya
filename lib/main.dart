import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';

import 'package:okbhaiya/screen/CheakRegistation.dart';
import 'package:okbhaiya/screen/OnbordScreen.dart';
import 'package:okbhaiya/screen/loading.dart';
import 'package:okbhaiya/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get create => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medigrow My Clinic',
      theme: themeData(context),
      home: FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors9611
          if (snapshot.hasError) {
            return const CupertinoAlertDialog(
              content: Text('Something went wrong!'),
            );
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return AuthenticationWrapper();
          }
          // Otherwise, show something whilst waiting for initialization to complete
          return LoaadingWindow();
        },
      ),
    );
  }
}

class AuthenticationWrapper extends ConsumerWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);

    return _authState.when(
        data: (user) {
          if (user != null) {
            return CheakRegistation(
                user: user); // CheakRegistation(user: user);
          }
          return OnbordScreen();
        },
        loading: () {
          return LoaadingWindow();
        },
        error: (e, stackTrace) => CupertinoAlertDialog(
              content: Text('Something went wrong!'),
            ));
  }
}
