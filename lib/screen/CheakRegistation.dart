import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'package:hooks_riverpod/all.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';
import 'package:okbhaiya/screen/Navigation/Navigation.dart';
import 'package:okbhaiya/screen/Registration/Registration.dart';
import 'package:okbhaiya/service/AuthenticationService.dart';

import 'loading.dart';

// ignore: must_be_immutable
class CheakRegistation extends ConsumerWidget {
  User user;
  CheakRegistation({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _status = watch(isRegisteredProvider);
    print(_status);
    return _status.when(
        data: (status) {
          if (status == Status.Authenticated) {
            return NavitionRoute(user: user); // HomePage(user: user);
          }
          // return LoaadingWindow();
          return Registration(
            activeStep: 1,
            user: user,
          );
        },
        loading: () {
          return LoaadingWindow();
        },
        error: (e, stackTrace) => CupertinoAlertDialog(
              content: Text('Something went wrong!'),
            ));
  }
}
