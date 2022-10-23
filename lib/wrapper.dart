
import 'package:flutter/material.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:promracing/user.dart';
import 'dart:developer';
import 'package:promracing/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wrapper extends StatelessWidget {
   Wrapper({ Key? key, required this.a }) : super(key: key);
     static const  String routeName= '/Wrapper' ;
       AuthService a;

  @override
  Widget build(BuildContext context) {
      final user = Provider.of<appUser?>(context);
      log("kkkkkkkkkkkkk");
      
      if(user == null){
        log(user?.uid ?? "nnn");
            return SignIn(a: a) ;

      }
    else{
      log(user.uid);
    return MainPageWidget(a: a);

    }
  }
}