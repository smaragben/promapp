import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromMembersWidget extends StatefulWidget {
  const PromMembersWidget({Key? key}) : super(key: key);
  static const String routeName = "/PromMembers";
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _PromMembersState();
}

class _PromMembersState extends State<PromMembersWidget> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 204, 211),
        body: Column(
          children: wrapper(context, members(), _auth, 2),
        ));
  }
}

members() {
  List<Map<dynamic, dynamic>> lists = [];
  final dbRef = FirebaseFirestore.instance.collection("promMembers");

  return StreamBuilder<QuerySnapshot>(
      stream: dbRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildImage(snapshot.data);
        }

        return const LinearProgressIndicator();
      });
}

Widget _buildImage(QuerySnapshot? snapshot) {
  return ListView.builder(
      itemCount: snapshot?.docs.length ?? 0,
      itemBuilder: (context, index) {
        final doc = snapshot?.docs[index];
        return SizedBox(
          height: 280,
          width: 250,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 30,
                top: 30,
                child: Container(
                    height: 200,
                    width: 290,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        child: Ink.image(
                          image: NetworkImage(doc!["photo"]),
                          padding: const EdgeInsets.all(0.0),
                        ),
                        onTap: () {},
                      ),
                    )),
              ),
              Positioned(
                top: 25,
                left: 20,
                child: Container(
                  alignment: Alignment.center,
                  width: 170,
                  height: 35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.yellow,
                  ),
                  child: Text(doc["name"]),
                ),
              ),
              Positioned(
                top: -10,
                left: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 170,
                  height: 45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.orange,
                  ),
                  child: Text(doc["job"]),
                ),
              )
            ],
          ),
        );
      });
}
