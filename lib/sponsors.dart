import 'package:flutter/material.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);
  static const String routeName = "/Sponsors";
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 204, 211),
        body: Column(
          children: wrapper(context, members(), _auth, 6),
        ));
  }
}

members() {
  List<CollectionReference> list = [];
  var dbRef = FirebaseFirestore.instance.collection("supporters");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("mediaSponsorship");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("bronzeSponsors");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("silverSponsors");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("goldenSponsors");
  list.add(dbRef);
  dbRef = FirebaseFirestore.instance.collection("platinumSponsors");
  list.add(dbRef);

  for (int i = 0; i < list.length; i++) {
    return StreamBuilder<QuerySnapshot>(
        stream: dbRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildImage(snapshot.data);
          }

          return const LinearProgressIndicator();
        });
  }
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
                          image: NetworkImage(doc!["logo"]),
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
                    color: Colors.blue,
                  ),
                  child: Text(doc["name"]),
                ),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.purple,
                  ),
                  child: Text(doc["type"]),
                ),
              )
            ],
          ),
        );
      });
}
