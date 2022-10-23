import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:promracing/results.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/theme.dart';
import 'dart:developer';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key,}) : super(key: key);
 
  static const String routeName = "/QuizPage";
  @override

 _Quiz createState() => new _Quiz();
}


 class _Quiz extends State<QuizPage> {
 final AuthService _auth = AuthService();

      @override

    Widget build(BuildContext context) {
      
    return 
    Scaffold(
                    backgroundColor: Color.fromARGB(234, 79, 79, 83),
                    body:  _quizpage(),
                        
                  ) ;
  
  }

   
_quizpage() {
    return Container(alignment: Alignment.center, child:  ElevatedButton(
                              
                              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(5*MediaQuery.of(context).size.width/6, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), shape:  MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                              ),
 
                              child: Text("Ξεκίνα το Quiz"), 
                              onPressed:  (){ Navigator.pushNamed(context, '/Quizzes');}

                              
                              )
                              ); 
       }
}





