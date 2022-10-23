// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:promracing/cardlist.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPageWidget extends StatefulWidget {
  MainPageWidget({Key? key, required this.a}) : super(key: key);
  static const String routeName = "/MainPage";
  AuthService a;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 204, 204, 211),
        body: Column(
          children: wrapper(context, cards1(), widget.a, 1),
        ));
  }
}
