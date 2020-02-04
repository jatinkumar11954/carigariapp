import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isLoading = false;
  List<DocumentSnapshot> phone = [];

  void initState() {
    print("in init state");
    super.initState();
    getCategoryList();
  }

  getCategoryList() async {
    setState(() {
      isLoading = false;
    });
    // if(local.category==null){

    // }
    QuerySnapshot qs;

    qs = await Firestore.instance.collection("data").getDocuments();
    phone.isEmpty ? phone.addAll(qs.documents) : null;

    print("${phone[3].data["call"]}");

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar =AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Contact Us", style: TextStyle(color: Colors.white)),
              Image.asset(
                'images/logo.png',
                fit: BoxFit.fill,
                height: SizeConfig.blockSizeVertical * 4.5,
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
        );
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: appbar,
        bottomNavigationBar: bottomnavigation(context, 1),
        drawer: theDrawer(context),
        body: WillPopScope(
            onWillPop: () {
              Navigator.pushNamed(context, 'HomeScreen');
            },
            child: SafeArea(
                          child: isLoading
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Call ConversionGuru", style: TextStyle( fontSize: 16)),
                      //     InkWell(

                      //       onTap: () {
                      //        launch("tel://919010590693");
                      //       },
                      //       child: Icon(Icons.call),

                      //     )
                      //   ]
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Live Chat", style: TextStyle( fontSize: 16)),
                      //     InkWell(

                      //       onTap: () async {
                      //       await canLaunch("whatsapp://send?phone=0919010590693")? launch("whatsapp://send?phone=0919010590693"):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                      //       },
                      //       child: Icon(Icons.)
                      //     )
                      //   ]
                      // ),

                      Text("\n\n\n"),

                      Center(
                        child: 
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 2.5,
                              right: SizeConfig.blockSizeHorizontal * 1.5),
                          child: new SizedBox(
                            height: SizeConfig.blockSizeVertical * 6,
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: RaisedButton(
                              onPressed: () =>
                                  launch("tel:+91${phone[3].data["call"]}"),
                              child: Row(
                                children: <Widget>[
                                  new Text("CALL US",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.03,
                                      )),
                                      Spacer(),
                                       Icon(
          Icons.ring_volume,
          color: Colors.white,
        ),
                                ],
                              ),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Text("\n\n\n"),

                      //     child: new Text("Call me")),
                      Center(
                        child:
                         Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 2.5,
                              right: SizeConfig.blockSizeVertical * 1.5),
                          child: new SizedBox(
                            height: SizeConfig.blockSizeVertical * 6,
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: RaisedButton(
                              onPressed: () async =>
                                  //  var whatsappUrl ="whatsapp://send?phone=$phone";
                                  await canLaunch(
                                          "whatsapp://send?phone=091${phone[3].data["whatsapp"]}")
                                      ? launch(
                                          "whatsapp://send?phone=091${phone[3].data["whatsapp"]}")
                                      : print(
                                          "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed"),
                              child: Row(
                                children: <Widget>[
                                  new Text("Live chat (whatsApp)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.03,
                                      )),
                                       Spacer(),
                                       Icon(
          Icons.android  ,
          color: Colors.white,
        ),
                                ],
                              ),
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                                              child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeVertical * 5.5,
                                right: SizeConfig.blockSizeVertical * 1.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Address:",
                                    style: TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.03)),
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeVertical * 1,
                                      // right: SizeConfig.blockSizeVertical * 1.5
                                    ),
                                    child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("10-1-17, DANA CHAMBERS,",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025 )),
                                        Text("OPP.J.N.T.U. COLLEGE,",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        Text("BESIDES HYDERABAD HOUSE,",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                      Text("Carigari Furnitures,",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),

                                        Text("MASAB TANK,",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        Text("HYDERABAD - 500 004. ,A.P.",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        SizedBox(height:5.0),
                                        Text("Tel Cum Fax 040-30628610.",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        Text(
                                            "Mobile : 9246363415  9885444435.",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                                                                SizedBox(height:8.0),

                                        Text(
                                            "E-mail :",style:TextStyle(fontSize: 24)) ,
                                           Text(
                                            "   carigarifurniture@yahoo.co.in",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        Text("   carigarifurniture@gmail.com",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                        Text("   arvind@carigarifurniture.com",style:TextStyle(fontSize: ((SizeConfig.screenHeight) - (appbar.preferredSize.height)) * 0.025)),
                                      ],
                                    ))
                              ],
                            )),
                      )
                    ],
                  )
                  : Center(
                      child: Container(
                      child: Text("Loading"),
                    )),
            )),
      ),
    );
  }
}
