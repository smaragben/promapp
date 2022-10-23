// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:promracing/wrapper.dart';
import 'package:promracing/logo.dart';
import 'package:promracing/buttons.dart';
import 'package:promracing/cardlist.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/newsdetails.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/results.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'dart:developer';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.snapshot}) : super(key: key);
  final snapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 204, 211),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: const Color.fromARGB(234, 71, 59, 59),
                ),
              ),
              Positioned(
                top: 90,
                left: 175,
                child: GestureDetector(
                    onVerticalDragDown: (DragDownDetails) {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.white, size: 45)),
              )
            ],
          ),
          SizedBox(
            height: 650,
            width: 350,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    snapshot["title"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(snapshot["image"]),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot["descr"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
