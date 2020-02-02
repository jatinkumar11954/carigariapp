import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart';


class Register extends StatefulWidget
{
  Register({Key key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> _scaffoldkey =new GlobalKey<ScaffoldState>();
   final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInput;
  TextEditingController lastNameInput;
  TextEditingController phoneNumberInput;
  TextEditingController emailInput;
  TextEditingController pwdInput;
  TextEditingController confirmPwdInput;

  @override
  initState() {
    firstNameInput = new TextEditingController();
    lastNameInput = new TextEditingController();
    emailInput = new TextEditingController();
    phoneNumberInput=new TextEditingController();
    pwdInput = new TextEditingController();
    confirmPwdInput = new TextEditingController();
    super.initState();
  }
void callSnackBar(String me, [int err])
  {
    print("called me for scnack bar");
    if(err==2)
    {final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 5),
      action: new SnackBarAction(
        label: "EXIT",onPressed: (){
          // Navigator.pushNamed(context,"HomeScreen");
            exit(0);
        },
      ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }
  else{
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
      // action: new SnackBarAction(
      //   label: "OK",onPressed: (){
      //     Navigator.pushNamed(context,"HomeScreen");
     
      //   },
      // ),
      // backgroundColor: Colors.blue,
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }
  }
  // void callSnackBar(String msg)
  // {
  //   print("came here in snackbar");
  //   final SnackBar=new SnackBar(
  //     content:new Text(msg),
  //     duration:new Duration(seconds: 5),
  //     action:new SnackBarAction(
  //       label: "Ok",
  //       onPressed: (){
  //         Navigator.pushNamed(context, "HomeScreen");
  //       },
  //     )
  //   );
  //   _scaffoldkey.currentState.showSnackBar(SnackBar);
  // }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }
String phoneValidator(String value)
{
if (value.length!=10) {
      return 'Phone Number must be of 10 digits';
    } else {
      return null;
    }
}
  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
   

//  void SuccessMsg() {
//     // flutter defined function
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext ctxt) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text("Registered Successfully",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 2.5),),
//           content: new Text("You are registered successfully ,you can proceed ",style: TextStyle(fontSize:SizeConfig.blockSizeVertical * 1.7),),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             // new FlatButton(
//             //   child: new Text("Home"),
//             //   onPressed: () {
//             //     // Navigator.of(context).pop();
//             //    Navigator.pushNamed(context, 'HomeScreen');
//             //   },
//             // ),
//             // new FlatButton(
//             //   child: new Text("YES, EXIT"),
//             //   onPressed: () {
                
//             //     // Navigator.of(context).pop();
//             //   },
//             // ),
            
//           ],
//         );
//       },
//     );
//   }

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
      return new Scaffold(
                   key:_scaffoldkey,
                  // resizeToAvoidBottomPadding: false,
                  appBar: AppBar(
                    title: Text("Register Form"),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  // drawer: theDrawer(context),
                  // bottomNavigationBar: bottomnavigation(context,0),
                  body:WillPopScope(
                  onWillPop:()
                  {
                    callSnackBar("Click EXIT to leave from APP",2);
                    
                  },
                  child: Container(
                    // key: _registerFormKey,
                    margin: EdgeInsets.all(SizeConfig.blockSizeVertical*1.5),
                    child:Form(
                       key: _registerFormKey,
                      child: ListView(
                      // key: _registerFormKey,
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            style:textStyle,
                          // keyboardType: Text(),
                          controller: firstNameInput,
                          // validator:(value)
                          // {
                          //   if(value.length<3)
                          //   {
                          //     return "plz enter a valid first name";
                          //   }
                            
                          // },
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            labelText: "First Name",
                            hintText: "Enter your First Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),

                         Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            style:textStyle,
                          // keyboardType: Text(),
                          controller: lastNameInput,
                          // validator: (value)
                          // {
                          //   if(value.length<3)
                          //   {
                          //     return "plz enter a valid Last name";
                          //   }
                            
                          // },
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            labelText: "Last Name",
                            hintText: "Enter your Last Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            controller: emailInput,
                            keyboardType: TextInputType.emailAddress,
                            validator: emailValidator,
                            style:textStyle,
                          // keyboardType: Text(),
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            labelText: "Email ",
                            hintText: "Enter your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            controller: phoneNumberInput,
                            maxLength: 10,
                            validator: phoneValidator,
                            keyboardType: TextInputType.number,
                            style:textStyle,
                          // keyboardType: Text(),
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            
                            labelText: "Mobile",
                            hintText: "Enter your Mobile Number ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            controller: pwdInput,
                            style:textStyle,
                            validator: pwdValidator,
                            // obscureText: true,
                          // keyboardType: Text(),
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            labelText: "Password",
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),


                         Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1.5,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:TextFormField(
                            controller: confirmPwdInput,
                            style:textStyle,
                            validator: pwdValidator,
                            obscureText: true,
                          // keyboardType: Text(),
                          decoration: InputDecoration(
                            labelStyle:textStyle,
                            labelText: "Confirm Password",
                            hintText: "Re Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                            ),
                          ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:RaisedButton(
                          child: Text("Register"),
                          color: Colors.green,
                           onPressed: () {
                             print("clicked register button");
                              if (_registerFormKey.currentState.validate()) {
                                if (pwdInput.text ==
                                    confirmPwdInput.text) {
                                      callSnackBar("Registering new User named " +firstNameInput.text+".....");
                                      print("success");
                                  FirebaseAuth.instance 
                                      .createUserWithEmailAndPassword(
                                          email: emailInput.text,
                                  password: pwdInput.text)
                                  .then((currentUser) => Firestore.instance
                                      .collection("users")
                                      .document(currentUser.uid)
                                      .setData({
                                        "password":pwdInput.text,
                                        "uid": currentUser.uid,
                                        "fname": firstNameInput.text,
                                        "surname": lastNameInput.text,
                                        "email": emailInput.text,
                                        "mobile":phoneNumberInput.text,
                                        
                                      })
                                      .then((result) => {
                                            callSnackBar("Successfully Registered Thank You!"),
                                            // Navigator.pushAndRemoveUntil(
                                            // context,
                                            // MaterialPageRoute(
                                            //     builder: (context) => HomePage(
                                            //           title:
                                            //               firstNameInput
                                            //                       .text +
                                            //                   "'s Tasks",
                                            //           uid: currentUser.uid,
                                            //         )
                                            //         ),
                                            // (_) => false),
                                            // null,
                                            Navigator.pushNamed(context,"HomeScreen"),
                                        firstNameInput.clear(),
                                        lastNameInput.clear(),
                                        phoneNumberInput.clear(),
                                        emailInput.clear(),
                                        pwdInput.clear(),
                                        confirmPwdInput.clear()
                                      })
                                  .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                          } 
                        else {
                          print("fail");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("The passwords do not match"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                      }
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*1,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:Text("Do you have an Account, Then LOGIN here by clicking Sign in below:",style: TextStyle(fontSize: SizeConfig.blockSizeVertical*1.7),)
                          ),
                         Padding(
                          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*0.1,bottom:SizeConfig.blockSizeVertical*1.5 ),
                          child:RaisedButton(
                          child: Text("Sign in"),
                          color: Colors.blueAccent,
                           onPressed: () {
                                            Navigator.pushNamed(context,"Login");
                                     }
                          ),
                          ),
                      ],
                    ),
                    ),
                  ),
                    
                  ),
                    );

  }
}