import 'package:camera/camera.dart';
import 'package:promracing/newsdetails.dart';
import 'package:promracing/photos.dart';
import 'package:promracing/profile.dart';
import 'package:promracing/quiz.dart';
import 'package:promracing/register.dart';
import 'package:promracing/results.dart';
import 'package:promracing/rules.dart';
import 'package:promracing/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:promracing/leaderboard.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/Quizzes.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/wrapper.dart';
import 'package:promracing/user.dart';
import 'package:promracing/sponsors.dart';
import 'package:promracing/prom.dart';

import 'cameraPage2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      MainPageWidget.routeName: (BuildContext context) => MainPageWidget(
            a: AuthService(),
          ),
      Quizzes.routeName: (BuildContext context) => const Quizzes(),
      Result.routeName: (BuildContext context) => const Result(),
      PhotosWidget.routeName: (BuildContext context) => const PhotosWidget(),
      Sponsors.routeName: (BuildContext context) => const Sponsors(),
      PromMembersWidget.routeName: (BuildContext context) =>
          const PromMembersWidget(),
      QuizPage.routeName: (BuildContext context) => const QuizPage(),
      Rules.routeName: (BuildContext context) => const Rules(),
      Leaderboard.routeName: (BuildContext context) => const Leaderboard(),
    };
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an error ${snapshot.error.toString()}...");
            return const Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return StreamProvider<appUser?>.value(
                value: AuthService().user,
                initialData: null,
                child: Wrapper(a: AuthService()));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: routes,
    );
  }
}
