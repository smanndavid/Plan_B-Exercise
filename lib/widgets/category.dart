import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final Icon icon;
  final int widthSize;
  final int heightSize;

  const Category({Key key, this.title, this.icon,this.widthSize,this.heightSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: MediaQuery.of(context).size.height/heightSize,
        minWidth: MediaQuery.of(context).size.width/widthSize,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              icon,
              Text("$title",style: new TextStyle(fontSize: 11,),textAlign: TextAlign.start),
             ],
          ),
           ),
        onPressed: () => {},
        splashColor: Colors.grey,
);
  }
}