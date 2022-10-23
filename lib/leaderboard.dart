import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promracing/quiz.dart';
import 'package:promracing/services/auth.dart';

import 'mainpagewidget.dart';
//αυτο το leaderboard ειναι ενδεικτικό, το κανονικό θα εχει επικοινωνία με τη βάση

class Leaderboard extends StatefulWidget {
  const Leaderboard({
    Key? key,
  }) : super(key: key);

  static const String routeName = "/Leaderboard";
  @override
  _LeaderBoardState createState() => new _LeaderBoardState();
}

// class _LeaderBoardState extends State<Leaderboard> {
//   final AuthService _auth = AuthService();
//   final controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     var r = const TextStyle(color: Colors.purpleAccent, fontSize: 34);
//     return Stack(
//       children: <Widget>[
//         Scaffold(
//           body: Container(
//             margin: const EdgeInsets.only(top: 65.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     margin: const EdgeInsets.only(left: 15.0, top: 10.0),
//                     child: RichText(
//                         text: const TextSpan(
//                             text: "Leader",
//                             style: TextStyle(
//                                 color: Colors.deepPurple,
//                                 fontSize: 30.0,
//                                 fontWeight: FontWeight.bold),
//                             children: [
//                           TextSpan(
//                               text: " Board",
//                               style: TextStyle(
//                                   color: Colors.redAccent,
//                                   fontSize: 30.0,
//                                   fontWeight: FontWeight.bold))
//                         ])),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 15.0),
//                     child: Text(
//                       'Rank Board: (Το leaderboard λειτουργει με dummy δεδομένα, το ολοκληρωμένο θα εχει επικοινωνία με τη βάση και θα έχει μορφή λίστας). Είναι μια μορφή gamefication που θέλαμε να εφαρμόσουμε, αλλά δεν προλαβαμε να φτιαξουμε τον αντίστοιχο πίνακα στο firebase',
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 40.0, top: 48.0),
//                     child: RichText(
//                         text: const TextSpan(
//                             text: "Player1                             ",
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontSize: 15.0,
//                             ),
//                             children: [
//                           TextSpan(
//                               text: "208 Points",
//                               style: TextStyle(
//                                 color: Colors.deepOrangeAccent,
//                                 fontSize: 15.0,
//                               ))
//                         ])),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 15.0),
//                     child: Text(
//                       '',
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 40.0, top: 10.0),
//                     child: RichText(
//                         text: const TextSpan(
//                             text: "Smaragda                        ",
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontSize: 15.0,
//                             ),
//                             children: [
//                           TextSpan(
//                               text: "190 Points",
//                               style: TextStyle(
//                                 color: Colors.deepOrangeAccent,
//                                 fontSize: 15.0,
//                               ))
//                         ])),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 15.0),
//                     child: Text(
//                       '',
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 40.0, top: 10.0),
//                     child: RichText(
//                         text: const TextSpan(
//                             text: "Aggelos                            ",
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontSize: 15.0,
//                             ),
//                             children: [
//                           TextSpan(
//                               text: "100 Points",
//                               style: TextStyle(
//                                 color: Colors.deepOrangeAccent,
//                                 fontSize: 15.0,
//                               ))
//                         ])),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 15.0),
//                     child: Text(
//                       '',
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 40.0, top: 10.0),
//                     child: RichText(
//                         text: const TextSpan(
//                             text: "SofiaB                               ",
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontSize: 15.0,
//                             ),
//                             children: [
//                           TextSpan(
//                               text: "99 Points",
//                               style: TextStyle(
//                                 color: Colors.deepOrangeAccent,
//                                 fontSize: 15.0,
//                               ))
//                         ])),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(left: 15.0, top: 200.0),
//                     child: Text(
//                       '',
//                     ),
//                   ),
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         maximumSize: MaterialStateProperty.all(Size(
//                             1 * MediaQuery.of(context).size.width / 3, 40.0)),
//                         backgroundColor: MaterialStateProperty.all(Colors.red),
//                       ),
//                       child: Row(children: const [
//                         Icon(Icons.exit_to_app),
//                         Text("     Έξοδος")
//                       ]),
//                       onPressed: () async {
//                         Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (context) =>
//                                 MainPageWidget(a: AuthService())));
//                         //Navigator.pushNamed(context, "/MainPage");
//                       },
//                     ),
//                   ]),
//                 ]),
//           ),
//         ),
//       ],
//     );
//   }
// }

class _LeaderBoardState extends State<Leaderboard> {
  int i = 0;
  Color my = Colors.brown, CheckMyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var r = const TextStyle(color: Colors.purpleAccent, fontSize: 34);
    return Stack(
      children: <Widget>[
        Scaffold(
            body: Container(
          margin: const EdgeInsets.only(top: 65.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                child: RichText(
                    text: const TextSpan(
                        text: "Leader",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: " Board",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Global Rank Board: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .orderBy('TotalPoints', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          i = 0;
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                print(index);
                                if (index >= 1) {
                                  print('Greater than 1');
                                  if (snapshot.data?.docs[index]
                                          .data()['TotalPoints'] ==
                                      snapshot.data?.docs[index - 1]
                                          .data()['TotalPoints']) {
                                    print('Same');
                                  } else {
                                    i++;
                                  }
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: i == 0
                                                  ? Colors.amber
                                                  : i == 1
                                                      ? Colors.grey
                                                      : i == 2
                                                          ? Colors.brown
                                                          : Colors.white,
                                              width: 3.0,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, top: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                                  .data()[
                                                              'username'],
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .deepPurple,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          maxLines: 6,
                                                        )),
                                                    Text("Points: " +
                                                        snapshot
                                                            .data!.docs[index]
                                                            .data()[
                                                                'TotalPoints']
                                                            .toString()),
                                                  ],
                                                ),
                                              ),
                                              Flexible(child: Container()),
                                              i == 0
                                                  ? Text("🥇", style: r)
                                                  : i == 1
                                                      ? Text(
                                                          "🥈",
                                                          style: r,
                                                        )
                                                      : i == 2
                                                          ? Text(
                                                              "🥉",
                                                              style: r,
                                                            )
                                                          : const Text(''),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0,
                                                    top: 13.0,
                                                    right: 20.0),
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const QuizPage()));
                                                    //Navigator.pushNamed(context, "/MainPage");
                                                  },
                                                  child: const Text(
                                                    "Challenge",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  style: ButtonStyle(
                    maximumSize: MaterialStateProperty.all(
                        Size(1 * MediaQuery.of(context).size.width / 3, 40.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Row(children: const [
                    Icon(Icons.exit_to_app),
                    Text("     Έξοδος")
                  ]),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            MainPageWidget(a: AuthService())));
                    //Navigator.pushNamed(context, "/MainPage");
                  },
                ),
              ]),
            ],
          ),
        )),
      ],
    );
  }
}
