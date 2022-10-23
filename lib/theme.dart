
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'package:promracing/theme.dart';
import 'package:promracing/logo.dart';
import 'package:promracing/buttons.dart';
import 'package:promracing/cardlist.dart';

import 'package:promracing/mainpagewidget.dart';







   
wrapper(context, main, _auth, curindex){
   return [
       Container(
           padding:  const EdgeInsets.only(top:0.0),
            child:  logo(context, _auth),),
       const SizedBox(
   height:10.0,),
       SizedBox(
              height: 40.0,
              child: ListView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                children: buttons(context, curindex),
              ), 
            ),
       const SizedBox(
   height:10.0,),
  
   const SizedBox(
   height:5.0,),
              SizedBox(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height -10.0 - 5.0 - 40.0 - 10.0-140.0,
              
              child: main
              ), 
      ];
}
