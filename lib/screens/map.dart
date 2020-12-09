import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plan_b_exercise/screens/search.dart';
import 'package:plan_b_exercise/widgets/InputSearch.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  GoogleMapController mapController;

  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
              MaterialPageRoute(builder: (context) => Search()),
                ),
                child: Icon(
                  Icons.menu  
            ),
          ),
        ]
      ),
      ),
      body: Stack(
        children: [
         

           Positioned(
             child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 4,
                ),
              ),
             ),
             Positioned(
               left: 1,
               right: 1,
               bottom: 1,
               child: SizedBox(     
               child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children:[
                   cardSearchResult("assets/images/dis2.jpg"),
                   cardSearchResult("assets/images/coffee.jpg"),
                   cardSearchResult("assets/images/dis2.jpg"),
                 ]
               ),
              ),
             ),
            ),

            Positioned(
               left: 1,
               right: 1,
               top: 0.0,
           child: SizedBox(
             child: Container(
            height: 50,
             color: Colors.white,
             alignment: Alignment.centerLeft,
             width: MediaQuery.of(context).size.width,
             child: Text("   277 resturants found",)
             ),
           ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.red[800],
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
  Widget cardSearchResult(String imagePath){
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(9),
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 90,
              height: 70,
              decoration: BoxDecoration(
                image:DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Phnom Penh Coffee",style: TextStyle(fontSize: 15),),
                    SizedBox(width: 65,),
                    Container(
                      width: 50,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(child:Text("4.2 km",style: TextStyle(fontSize: 11,color: Colors.grey),) ,),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Open Now",style: TextStyle(fontSize: 12,color: Colors.green),),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width:230),
                    Icon(Icons.directions,size: 30,color: Colors.blue[800],)
                  ],
                ),
                ],
              ),
            ),
          ],
        ),
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
  Widget mapView(){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
              image: AssetImage('assets/images/map.jpg'),
              fit: BoxFit.fitHeight,
                ),
      ),
    );
  }
}