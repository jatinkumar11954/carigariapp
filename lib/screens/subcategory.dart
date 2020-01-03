import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../Arrangements/variables.dart' as global;
import 'homescreen.dart';
import 'product.dart'as local;
// import '../Arrangements/variables.dart';

class SubCategory extends StatefulWidget {
  // SubCategory([int index]);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  bool isLoading = false,productIs=true;

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
 
  void callSnackBar(String me) {
    print("called me for scnack bar");
    final SnackBar = new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 1),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     // Navigator.pushNamed(context, ;
      //     // exit(0);
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }

  @override
  Widget build(BuildContext context) {
    // void Alert(){
    //   return
    // }
     if(global.category.isEmpty){
      
    setState(() {
      productIs = false;
    });
    }
     final index = ModalRoute.of(context).settings.arguments ; 

    Alerting(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              // elevation: 200.0,
              // backgroundColor: Colors.white60,
              // title: Text("Please Enter SMS Code"),
              titlePadding: EdgeInsets.all(20.0),
              content: Text(" Shop further Or Checkout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockSizeVertical * 2.9,
                  )),
              contentPadding: EdgeInsets.all(10.0),

              actions: <Widget>[
                new FlatButton(
                  child: Text("Shop ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, "HomeScreen");
                  },
                ),
                new FlatButton(
                  child: Text("Checkout",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, "Cart");
                  },
                )
              ],
            );
          });
    }

    // TODO: implement build
    return  Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        backgroundColor: Colors.cyan[300],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(global.category[index].data['name']),
            Image.asset(
              'images/logo.png',
              fit: BoxFit.fill,
              height: SizeConfig.blockSizeVertical * 4.5,
            ),
          ],
        ),
      ),
      drawer: theDrawer(context),
      bottomNavigationBar: bottomnavigation(context, 2),
      body:productIs?
          // WillPopScope(
          //   onWillPop: ()
          //   {
          //     Navigator.pushNamed(context,"Product",arguments: );
          //   },
          //   child:
          // Text(global.category[0].data['a']),
          // Text("\n"),
          Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 9.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
              width: SizeConfig.blockSizeVertical * 85,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text(
                    "\t\t\tProduct Description for " ,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeVertical * 2.9,
                    ),
                  ),
                   Center(
                     child: Text(
                      global.category[index].data['name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      ),
                  ),
                   ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.network(
                  global.category[index].data['image']),
            ),
            Divider(),
            // Image.network(global.category[0].data['image']),
            Text(
                "\t\t\tPrice:  ₹ ${global.category[index].data['price']}",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.blockSizeVertical * 2.9,
                )),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 13,
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("\t\t\tQuantity ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,
                          )),
                      Text("\t\t\t Available:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.5,
                          )),
                    ],
                  ),
                  Text(
                      "\t\t\t${global.category[index].data["quantity"]}",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("\t\t\tDescription:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeVertical * 2.9,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // SizedBox(
                      //   width:30,
                      // ),
                      Text(
                          "\t\t\t${global.category[index].data['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeVertical * 2.9,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("\t\t\t[Delevery Charges:extra",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.2,
                      )),
                  Text("\t\t\tGST:18% extra]",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeVertical * 2.2,
                      )),
                ],
              ),
            ),

            Divider(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 6,
              width: SizeConfig.blockSizeHorizontal * 50,
              child: RaisedButton(
                elevation: 5.0,
                color: Colors.brown[400],
                child: Text("Add +",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeVertical * 4,
                    )),
                onPressed: () async {
                  print("clilcked to  add");

                  // print(global.category[1].data["name"]);
                  global.cart.add(global.category[index]);

                  global.totalamount = 0;
                  for (int i = 0; i < global.cart.length; i++) {
                    global.totalamount += global.cart[i].data["price"];
                  }

                  print(global.totalamount.toString());

                  Alerting(context);

                  // Firestore.instance
                  // .collection("selected")
                  // .document("1")
                  // .collection("cart")
                  // // .add({
                  // //   "a":index.toString(),
                  // // }).catchError((err) =>print(err));
                  // .document("cart")
                  // // .collection("cart")
                  // // .document(index.toString());
                  // .setData({
                  //       "name":"jp"

                  // })
                  // .then((result)=>
                  // {

                  // }) .catchError((err) =>print(err));
                  // //  callSnackBar("Please check the details properly"));

                  // await Future.delayed(const Duration(seconds: 1));
                  // Alerting(context);
                  // await Future.delayed(const Duration(seconds: 5));
                  // Navigator.pushNamed(context,"HomeScreen");  jp

                  // global.
                  // print("clicked "+global.category[index].data['a']);
                  // callSnackBar("Added "+global.category[index].data['a'] +" to the cart");
                  // // global.cart=global.category[0].data['a'];
                  // // global.CartData=
                  // // CallForAdding();

                  //  Firestore.instance
                  //           .collection("cart")
                  //           .document(global.category[index].data['a'].toString())
                  //           .setData({
                  //             // "name":nameInput.text,
                  //             "name":global.category[index].data['a'].toString(),
                  //             "price":global.category[index].data['price'].toString(),

                  //           })
                  //           .then((result) => {

                  //           })
                  //       .catchError((err) => callSnackBar("Please check the details properly"));

                  // await Future.delayed(const Duration(seconds: 1));
                  // Alerting(context);
                  // Navigator.pushNamed(context,"HomeScreen");
                },
              ),
            ),
            isLoading
                ? Container(
                    child: Text("Loading"),
                  )
                : Container()
          ],
          // child: Text(global.category[0].data['a']),
        ),
        // ),
      ): Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      "\n\n\n\t\t\t There are no products in this category.\n\n\n\t\t\tThank You",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 2.5,
                          color: Colors.green),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width:SizeConfig.blockSizeHorizontal*95,
                        height:SizeConfig.blockSizeVertical * 5.5,
                                          child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.brown[400],
                            child: Text("Back to Categories",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.blockSizeVertical * 4,
                                )),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "HomeScreen");
                            }),
                      ),
                      SizedBox(height:SizeConfig.blockSizeVertical * 2,)
                    ],
                  ),
                ],

              )
    );
  }
}
