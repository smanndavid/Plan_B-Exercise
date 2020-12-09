import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBtn extends StatelessWidget {
  final String title;
  final double widthSize;
  final double heightSize;

  const TabBtn({Key key, this.title, this.widthSize,this.heightSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
        ),
        height: MediaQuery.of(context).size.height/heightSize,
        width: MediaQuery.of(context).size.width/widthSize,
        color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("$title",style: new TextStyle(fontSize: 11,),textAlign: TextAlign.start),
             ],
          ),
       
);
  }
}