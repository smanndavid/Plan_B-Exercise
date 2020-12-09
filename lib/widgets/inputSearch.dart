import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  
  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height/22,
    width: (MediaQuery.of(context).size.width/2)+98,
    margin: EdgeInsets.all(15),
    child: MaterialButton(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
    ),
    color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.search_rounded,size: 25,color: Colors.red[800],),
              SizedBox(width: 10,),
              Text("Coffee",style: new TextStyle(fontSize: 13,color: Colors.grey),),
              SizedBox(width: 175,),
              Icon(Icons.cancel,size: 18,color: Colors.grey,)
             ],
          ),
        onPressed:(){},
        splashColor: Colors.grey

  ),
  );
  }
}