import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plan_b_exercise/widgets/category.dart';
import 'package:plan_b_exercise/widgets/searchBox.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          coverPhoto(),
          categories(),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(7) ,
            child: Column(
              children: [
                txt("Recommended"),
                SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardView("Most View",'assets/images/drink.jpg',Icon(Icons.remove_red_eye_outlined,color: Colors.white,)),
                    cardView("Most used\n  coupon",'assets/images/food1.jpg',Icon(Icons.ac_unit,color: Colors.white,)),
                    cardView("Top Review",'assets/images/resturant.jpg',Icon(Icons.ad_units_sharp,color: Colors.white,)),
                  ],
                ),
                SizedBox(height: 30,),
                txt("Coupon"),
                SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(
                  children: [
                    discoutView('assets/images/dis2.jpg'),
                    SizedBox(width: 10,),
                    discoutView('assets/images/dis1.jpg'),
                  ],
                ),
                ),
              ],
            ),
          ),
        ]
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
          icon: Icon(Icons.account_circle),
          label: "Me",
          
          ),
      ],

       currentIndex: _selectedIndex,
         selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
    ),
      
    );
  }

  Widget coverPhoto(){
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
          height: (MediaQuery.of(context).size.height/4)+15 ,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cover.jpg'),
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.fitHeight,
            ),
          )
        ),
          SearchBox(),
           Positioned(
             bottom: 100,
             child: Container(
              height: 60 ,
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/app_logo.jpg'),
                    fit: BoxFit.fitHeight,
                ),
              )
             )
            ),
          ],
      ),    
  );
}

Widget categories(){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Category(title:"Near me", icon:Icon(Icons.location_searching,color: Colors.red[800],),widthSize:3 ,heightSize:12 ,),
        Category(title: "Type of food",icon: Icon(Icons.food_bank,color: Colors.red[800]),widthSize:3 ,heightSize:12 ,),
        Category(title: "Location",  icon:Icon(Icons.location_on,color: Colors.red[800]),widthSize:3 ,heightSize:12 ,),
      ],),
  );
}

Widget txt(String txt){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(txt,style: new TextStyle(fontSize: 16),),
    ],
  );
}

Widget cardView(String txt, String imagePath,Icon icon){
    return Stack(
      alignment: Alignment.center,
      children:[
        Container(
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width/3.2,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
            image: AssetImage(imagePath),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
            fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          child: Column(
            children:[
              icon,
              SizedBox(height: 5,),
              Text(txt,style: TextStyle(color: Colors.white, fontSize: 16),)
            ]
          ),
          
        )
      ] 
    );    
  }

Widget discoutView(String imagePath){
    return Container(
            height: MediaQuery.of(context).size.height/5,
            width: (MediaQuery.of(context).size.width)-80,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fitWidth,
              ),
            ),
        ); 
  }
}



