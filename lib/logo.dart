import 'package:flutter/material.dart';
import 'package:promracing/profile.dart';
import 'package:promracing/signin.dart';

logo(context, _auth) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 7)
      ],
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      color: Color.fromARGB(234, 79, 79, 83),
    ),
    width: MediaQuery.of(context).size.width,
    height: 140.0,
    child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset('assets/prom.png',
                      width: 135, height: 30, fit: BoxFit.fill),
                ],
              ),
            ),
            const Spacer(),
            Column(children: [
              Row(
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  profilepic(context, _auth)
                ],
              ),
            ]),
            const SizedBox(width: 10),
          ],
        )),
  );
}

profilepic(context, _auth) {
  return IconButton(
    iconSize: 50,
    padding: const EdgeInsets.all(0),
    highlightColor: Colors.transparent,
    onPressed: () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Profile(a: _auth)));
    },
    splashColor: Colors.transparent,
    icon: Image.asset('assets/profilepic.png',
        width: 50, height: 50, fit: BoxFit.fill),
  );
}
