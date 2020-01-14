
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 0, top: 80, right: 20, bottom: 0),
                  alignment: Alignment.centerRight,
                  child: new IconButton(icon: Icon(Icons.info_outline), onPressed: null)
                ),
                new Container(
                    margin: EdgeInsets.only(left: 0, top: 80, right: 20, bottom: 0),
                    alignment: Alignment.centerRight,
                    child: new IconButton(icon: Icon(Icons.lock_outline), onPressed: null)
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                      margin: EdgeInsets.only(top: 90, left: 22, right: 22),
                      child: new Text(
                        'Report incidents in the Brussels Public spaces and participate in the improvement of your city',
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 23.0,
                        ),
                      )
                  )

                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: new Text(
                    'Please call police in case of emergency'
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(top: 20),
                  child:  RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(color: Colorss.white_txt)),
                        color: Colorss.blue_background,
                        textColor: Colors.red,
                        padding: EdgeInsets.only(left: 30, right: 40, bottom: 15, top: 15),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.report_incident1);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 40, left: 0),
                              child: Icon(Icons.camera_alt, color: Colorss.white,),
                            )
                            ,
                            Padding(
                              padding: EdgeInsets.only(right: 40, left: 0),
                              child: Text(
                                "Report An Incident".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),

                          ],
                        )
                    )
                ),

              ],
            )
          ],
        ),
    );
  }


  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }
}
