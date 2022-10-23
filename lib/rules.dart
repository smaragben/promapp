// ignore_for_file: deprecated_member_use, unused_element

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/results.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class Rules extends StatefulWidget {
  const Rules({
    Key? key,
  }) : super(key: key);
  static const String routeName = "/Rules";
  @override
  _Rules createState() => new _Rules();
}

class _Rules extends State<Rules> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 204, 211),
        body: Column(
          children: wrapper(context, rules1(), _auth, 5),
        ));
  }
}

rules1() {
  List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("Rules");

  return StreamBuilder<QuerySnapshot>(
      stream: dbRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildRule(snapshot.data);
        }

        return const LinearProgressIndicator();
      });
}

_launchURL() async {
  const url = 'https://www.ioas.gr/uploads/docs/2016/05/397.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLApp() async {
  const url = 'https://www.ioas.gr/uploads/docs/2016/05/397.pdf';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _buildRule(QuerySnapshot? snapshot) {
  return ListView.builder(
      itemCount: snapshot?.docs.length ?? 0,
      itemBuilder: (context, index) {
        final doc = snapshot?.docs[index];
        return SizedBox(
          height: 280,
          width: 250,
          child: Column(
            children: <Widget>[
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepOrangeAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    doc!["rulenum"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    doc["rule_explanation"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              TextButton(
                onPressed: _launchURLApp,
                child: new Text('Would you like to learn more?'),
              ),
            ],
          ),
        );
      });
}
