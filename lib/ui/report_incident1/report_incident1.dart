import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/strings.dart';

class ReportIncidentScreen1 extends StatefulWidget {
  @override
  _ReportIncidentScreen1State createState() => _ReportIncidentScreen1State();
}

class _ReportIncidentScreen1State extends State<ReportIncidentScreen1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorss.blue_background,
        centerTitle: true,
        title: new Text(Strings.appBar1, style: TextStyle(color: Colorss.white),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colorss.white,
            semanticLabel: 'back',
          ),
          onPressed: () {
            print('Back Pressed');
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 0, bottom: 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.camera_alt, color: Colorss.blue_background,),
                SizedBox(width: 10,),
                Text(Strings.picture_of_the_incident, style: TextStyle(color: Colorss.blue_background),)
              ],
            ),
            Container(

            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: 20,
                    height: 100.0,
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return _circularImageWidget();
                      },
                    ),
                  ),
                ),
                _circularImageWidget()
              ],
            ),
            Row(
              children: <Widget>[

              ],
            )
          ],
        ),
      )
    );
  }

  Widget _circularImageWidget() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 4,
            color: Colorss.add_btn_bg
        ),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/ic_add.png')
        ),
      ),
    );
  }

}
