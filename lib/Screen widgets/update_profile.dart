import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile_Screen extends StatefulWidget {
  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  Color color;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myFocusNode.addListener(() {
      setState(() {
        color = myFocusNode.hasFocus ? Colors.blue : Colors.red;
      });
    });
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(

            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0],
                          colors: [
                            Color(0xFFf5f1e4),
                            // Color(0xFFf5eac6),
                            // Color(0xFFfae089),
                            // Color(0xFFed5f58),
                          ],
                        )),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 22.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text('UPDATE PROFILE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,

                                          color: Colors.black)),
                                ),
                                _status ? _getEditIcon() : Container(),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Stack(fit: StackFit.loose, children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: width*0.49,
                                  height: height*0.18,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 2.3),
                                      )
                                    ],
                                  ),
                                  child: Container(
                                      width: 120.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                          ExactAssetImage('assets/av.png'),
                                          //fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.red[100],
                                      radius: 20.0,
                                      child: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.grey[800]

                                      ),

                                    )
                                  ],
                                )),
                          ]),
                        ),
                        SizedBox(
                          height: height* 0.01,
                        ),

                        Container(

                          height: height*0.69,
                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: height* 0.01,
                              ),
                              Text(
                                'Parsonal Information',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ).centered().p(10.0),
                              SizedBox(
                                height: height* 0.02,
                              ),

                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            hintText: "Enter Your Name",
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                            ),

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          enabled: !_status,
                                          autofocus: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: height* 0.02,
                              ),

                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            hintText: "Enter Email ID",
                                            labelText: "Email",
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          enabled: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: height* 0.02,
                              ),

                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            hintText: "Enter Mobile Number",
                                            labelText: "Mobile No.",
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),

                                          ),
                                          enabled: !_status,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: height* 0.02,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            hintText: "Enter your Address",
                                            labelText: "Address",
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                            )
                                            ,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          enabled: !_status,
                                          autofocus: !_status,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: height* 0.02,
                              ),

                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: TextField(
                                            decoration: const InputDecoration(
                                              hintText: "Enter Pin Code",
                                              labelText: "PinCode.",
                                              labelStyle: TextStyle(
                                                  color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                                borderRadius: const BorderRadius.all(
                                                  const Radius.circular(10.0),
                                                ),
                                              ),
                                            ),
                                            enabled: !_status,
                                          ),
                                        ),
                                        flex: 2,
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            hintText: "Enter State",
                                            labelText: "State",
                                            labelStyle: TextStyle(
                                                color: Colors.black, fontSize: 15.0 , fontWeight: FontWeight.bold
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                          enabled: !_status,
                                        ),
                                        flex: 2,
                                      ),
                                    ],
                                  )),
                              !_status ? _getActionButtons() : Container(),
                            ],
                          ),
                        ).p(10.0)
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ));
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 28.0),


      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                    child: Text("Save"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                    child: Text("Cancel"),
                    textColor: Colors.black,
                    color: Colors.yellow[300],

                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.blueAccent[100],
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.black,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}