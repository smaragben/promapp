import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promracing/user.dart';
import 'dart:developer';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = "";

  appUser? createuser(User? fireuser, String? username, String? email) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    if (username != null && fireuser!.uid != null) {
      String fireuid = fireuser.uid.toString();
      uid = fireuid;
      users.doc(uid).set({
        'uid': uid,
        'username': username,
        'email': email,
        'image': null,
        'bestscore': 0
      });
    }
    return fireuser != null ? appUser(uid: fireuser.uid) : null;
  }

  appUser? convuser(User? fireuser) {
    return fireuser != null ? appUser(uid: fireuser.uid) : null;
  }

  Future<appUser?> getuser(User? fireuser) async {
    var users = null;
    if (fireuser != null) {
      users = FirebaseFirestore.instance
          .collection('users')
          .doc(fireuser.uid)
          .snapshots();
      uid = fireuser.uid;
    }
    return await users != null
        ? appUser(
            uid: fireuser?.uid ?? "",
            username: users.data["username"],
            image: users.data["image"],
            password: users.data["password"],
            email: users.data["email"],
            bestscore: users.data["bestscore"])
        : null;
  }

  Stream<appUser?> get user {
    return _auth.authStateChanges().map((User? user) {
      log("here");

      return convuser(user);
    });
  }

  Future<appUser?> loaduserdata() async {
    var users = null;
    if (uid != "") {
      users =
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    }
    return await users != null
        ? appUser(
            uid: uid,
            username: users.data["username"],
            image: users.data["image"],
            password: users.data["password"],
            email: users.data["email"],
            bestscore: users.data["bestscore"])
        : null;
  }

  Future signinanon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print(createuser(user, null, null));
      return createuser(user, null, null);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signin(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      uid = user!.uid;
      return appUser(
          uid: user.uid,
          username: "",
          image: "",
          password: password,
          email: email,
          bestscore: 0);
    } catch (e) {}
  }

  Future register(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return createuser(user, username, email);
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  Future signut() async {
    try {
      log("hr");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return;
    }
  }
}
