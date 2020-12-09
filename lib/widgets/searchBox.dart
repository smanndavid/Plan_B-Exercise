import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_b_exercise/screens/search.dart';

class SearchBox extends StatefulWidget {
  
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height/19,
    margin: EdgeInsets.all(15),
    child: MaterialButton(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(7),
    ),
    color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.search_rounded,size: 30,color: Colors.red[800],),
              Text("Search Resturants",style: new TextStyle(fontSize: 15,color: Colors.grey),textAlign: TextAlign.start,),
             ],
          ),
        onPressed: () =>Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => Search()),
   ),
        splashColor: Colors.grey

  ),
  );
  }
}