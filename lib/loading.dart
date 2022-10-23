
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget{
  Loading(this.size, this.backgroundcol);
  final double size;
  final Color backgroundcol;
  @override
  Widget build(BuildContext context){
    return Container(

      color: backgroundcol,
      child: Center(
          child: SpinKitRotatingCircle(color: Colors.red, size: size)
      )
    


    );
  }
}