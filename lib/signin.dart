import 'package:flutter/material.dart';
import 'package:promracing/loading.dart';
import 'package:promracing/mainpagewidget.dart';
import 'package:promracing/register.dart';
import 'package:promracing/services/auth.dart';
import 'package:promracing/wrapper.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
   SignIn({ Key? key, required this.a }) : super(key: key);
  static const  String routeName= '/Signin' ;
         AuthService a;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
    final _formKey = GlobalKey<FormState>();
  String error ='';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading(50.0, Color.fromARGB(234, 79, 79, 83)) : Scaffold(
      resizeToAvoidBottomInset:false,
                    backgroundColor:  Color.fromARGB(234, 79, 79, 83),

                    body: Column(
     
                        children: [
                          SizedBox(height: 1*MediaQuery.of(context).size.height/4),
                          Center(
                            child: Image.asset('assets/image2.png',
                            width: 80, height: 80)
                          ),
                           SizedBox(height: MediaQuery.of(context).size.height/20 ),
                           Padding(
                             padding: EdgeInsets.fromLTRB(35.0,0,35.0,0),
                              child:       Form(
                             key: _formKey,
                            child: 
                            Column(
                              children: [
                                TextFormField(
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal,),
                                    focusColor: Colors.red,
                                   border: OutlineInputBorder(   borderRadius : BorderRadius.all(Radius.circular(30.0)),
borderSide: BorderSide(color: Colors.black, width: 5.0)),
                                    focusedBorder: OutlineInputBorder(borderRadius : BorderRadius.all(Radius.circular(30.0)),
borderSide: BorderSide(color: Colors.red, width: 1.0)),
                                  labelText: 'Email...'
                                  ),
                                  style: TextStyle(color: Colors.black ),
                                   onChanged: (val){
                                    setState(() {
                                      email = val;
                                    });
                                  },),
                                  SizedBox(height:MediaQuery.of(context).size.height/30  ,),
                                TextFormField(
                                  cursorColor: Colors.grey,

                                   obscureText: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal,),
                                    focusColor: Colors.red,
                                   border: OutlineInputBorder(   borderRadius : BorderRadius.all(Radius.circular(30.0)),
borderSide: BorderSide(color: Colors.black, width: 5.0)),
                                    focusedBorder: OutlineInputBorder(borderRadius : BorderRadius.all(Radius.circular(30.0)),
borderSide: BorderSide(color: Colors.red, width: 1.0)),
                                  labelText: 'Password...'
                                  ),
                                  style: TextStyle(color: Colors.black ),
                                  onChanged: (val){
                                      setState(() {
                                        password = val;
                                      });
                                  },),
                                
                              ],)) ,),
                                                  SizedBox(height: MediaQuery.of(context).size.height/20 ),

                          Center(
                            child: ElevatedButton(
                              
                              style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(5*MediaQuery.of(context).size.width/6, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), shape:  MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                              ),
 
                              child: Text("Είσοδος"), 
                              onPressed:  () async {
                                     if(_formKey.currentState!.validate()){
                                       loading = true;
                                       dynamic result = await  widget.a.signin(email, password);
                                       if(result == null){
                                         setState(() {
                                           error = "Λάθος email ή password";
                                         loading = false;

                                         });
                                       }
                                       else{
                                         log(result.uid);
                                        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2)=> MainPageWidget(a: widget.a), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero));

                                       }
                                     }
                              }
                              
                              ),
                              ),
                              Center (
                                child:  ElevatedButton(
                              
                             style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(5*MediaQuery.of(context).size.width/6, 40.0)), backgroundColor: MaterialStateProperty.all(Colors.red), shape:  MaterialStateProperty.all<RoundedRectangleBorder>(

                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                              ),
                              child: Text("Είσοδος χωρίς λογαριασμό"), 
                              onPressed: () async {
                                loading = true;
                                      dynamic user = await  widget.a.signinanon();
                                      if(user == null){
                                        print("error signing in");
                                        loading = false;
                                      }
                                      else{
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MainPageWidget(a:  widget.a)));
                                        print("user signed in");
        }
                              },),),
                              Center(child:   Row(
                                mainAxisSize: MainAxisSize.min, children: [
                                Text("Αν δεν έχετε λογαριασμό", style: const TextStyle(fontSize: 10, color: Colors.white, )),
                                TextButton(
                                  child: Text(" Εγγραφείτε εδώ", style: const TextStyle(decoration: TextDecoration.underline, fontSize: 10, color: Colors.white,  )),
                                  onPressed: (){
                                    Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2)=> Register(a: widget.a), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero));

                                  },),
                                  


                              ],),),
                               SizedBox(height: MediaQuery.of(context).size.height/200 ),
                         Text(
                           error,
                           style: TextStyle(color: Colors.red, fontSize: 14.0)
                         ),

                            
                        ],
                        )
                  ) ;
  } 
}