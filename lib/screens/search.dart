import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_b_exercise/screens/map.dart';
import 'package:plan_b_exercise/widgets/InputSearch.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}
class _SearchState extends State<Search> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(true),
        child: Icon(
          Icons.arrow_back_ios,  
        ),
      ),
      titleSpacing:-20,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          InputSearch(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapView()),
            ),
            child: Icon(
              Icons.map_outlined  
        ),
      ),
        ]
      ),
      ),
      body: 
      SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          fillterTab(),
          Container(
            margin: EdgeInsets.all(7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: Text("277 resturants found",),
                ),
                SizedBox(height: 7,),
                  Column(
                    children:<Widget> [
                      cardSearchResult("assets/images/coffee.jpg"),
                      Divider(),
                      cardSearchResult("assets/images/dis1.jpg",),
                       Divider(),
                      cardSearchResult("assets/images/coffee.jpg"),
                       Divider(),
                      cardSearchResult("assets/images/dis2.jpg"),
                       Divider(),
                      cardSearchResult("assets/images/coffee.jpg"),
                       Divider(),
                      cardSearchResult("assets/images/coffee.jpg"),
                    ],
                  ),
              ],
            ),
          ),
        ]
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined,),
          label: "Home",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit_outlined),
          label: "Coupon",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.favorite,),
          label: "Favorite",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,),
          label: "Me",
          ),
      ],

       currentIndex: _selectedIndex,
         selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
    ),
    );
  }

  Widget fillterTab(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.black38,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            filterwithIcon("Filter",Icon(Icons.menu,color: Colors.white,)),
            filter("Ranking"),
            filter("View"),
            filter("Price"),
            ],
          ),
        ],
      ),    
    );
  }
  Widget filterwithIcon(String text,Icon icon){
    return Container(
                height: 27,
                width:100,
                child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.black45,
                onPressed: () { },
                child: Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      icon,
                      Text(text,style: TextStyle(fontSize: 13,color: Colors.white),),
                    ]
                  )),
              ),
              );
            }
  Widget filter(String text){
    return Container(
                height: 27,
                width:95,
                child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: Colors.black45,
                onPressed: () { },
                child: Center(    
                      child:Text(text,style: TextStyle(fontSize: 13,color: Colors.white),),  
                ),
              ),
              );
  }

Widget cardSearchResult(String imagePath){
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image:DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Coffee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(width: 175,),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(child:Text("4.2 km",style: TextStyle(fontSize: 11),) ,),
                    ),
                  ],
                ),
                
                SizedBox(height: 10,),
                Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                  Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                  Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                  Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                  Icon(Icons.star_half,color: Colors.orangeAccent,size: 18,),
                  SizedBox(width: 5,),
                  Text("4.5",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  SizedBox(width: 7,),
                  Text("|",style: TextStyle(fontSize: 14,color: Colors.grey),),
                  SizedBox(width: 7,),
                  Icon(Icons.remove_red_eye,size: 18,color: Colors.grey),
                  SizedBox(width: 5,),
                  Text("192 Views",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("6 Rating",style: TextStyle(fontSize: 12,color: Colors.grey),),
                    SizedBox(width: 4,),
                    Text("|",style: TextStyle(fontSize: 14,color: Colors.grey),),
                    SizedBox(width: 4,),
                    Text("10 Reviews",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.food_bank_outlined,color: Colors.grey,size: 20,),
                    Text("Khmer",style: TextStyle(fontSize: 12,color: Colors.grey),),
                    SizedBox(width: 4,),
                    Text("|",style: TextStyle(fontSize: 14,color: Colors.grey),),
                    SizedBox(width: 4,),
                    Icon(Icons.location_on,color: Colors.grey,size: 13,),
                    Text("Phnom Penh",style: TextStyle(fontSize: 12,color: Colors.grey),),
                     SizedBox(width: 20,),
                     Text("Closed Now",style: TextStyle(fontSize: 14,color: Colors.grey[400]),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}