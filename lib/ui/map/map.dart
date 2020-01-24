
import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/dimens.dart';
import 'package:flutter_app/constants/strings.dart';
import 'package:flutter_app/model/MapData.dart';
import 'package:flutter_app/widgets/SimpleTextView.dart';
import 'package:flutter_app/widgets/app_bar.dart';
import 'package:flutter_app/widgets/button_submit.dart';
import 'package:flutter_app/widgets/text_title.dart';
import 'package:geocoder/geocoder.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static LatLng _initialPosition;
  static  LatLng _lastMapPosition = _initialPosition;
  String address, locality, throughput, featurename, text = Strings.loading;
  double lat, lng;
  Completer<GoogleMapController> _controller = Completer();


  LocationData  currentLocation;

  Location  location = new Location();
  CameraPosition _currentPosition;

  @override
  void initState() {
    super.initState();
    //_getLocationPermission();
    // _getUserLocation();
    text = Strings.loading;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar().setAppBar(context, Strings.map, GoBack),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: Dimens.vertical_margin,horizontal: Dimens.horizontal_padding),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Text("Loading..."),
                  SimpleTextView().setTextInput(context, text?? Strings.loading),
                  SizedBox(width: 70),
                  MySubmitButton().setButton(context, "Ok", click)
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width*0.9,
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      onCameraMove: _onCameraMove,
                      onCameraIdle: _onCameraIdle,
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(latitude_current, longitude_current),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _GetDeviceLocation();
                        _controller.complete(controller);
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: mapButton(_GetDeviceLocation,
                                  Icon(
                                      Icons.my_location
                                  ), Colors.white),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: mapButton(_GetDeviceLocation,
                                  Icon(
                                      Icons.location_on,color: Colors.lightGreenAccent,
                                  ), Colors.transparent),
                    )
                  ],
                )
              ),


            ],
          ),
        )
      )
    );
  }

  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }

  static double latitude_current = 31.9414246;
  static double longitude_current = 35.8880857;

  void _GetDeviceLocation() async {

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
      await _goToCurrentLocation(myLocation.latitude, myLocation.longitude);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }

//    location.changeSettings(
//      accuracy: LocationAccuracy.HIGH,
//      distanceFilter: 0,
//      interval: 100,
//    );
//    location.onLocationChanged().listen((LocationData currentLocation) {
//      latitude_current = currentLocation.latitude;
//      longitude_current = currentLocation.longitude;
//      _goToTheLake();
//    });
  }


// Platform messages may fail, so we use a try/catch PlatformException.
//  void _getUserLocation() async {
//    print("a");
//    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//    print("b");
//    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
//    print("c");
//    setState(() {
//      _initialPosition = LatLng(position.latitude, position.longitude);
//      print('${placemark[0].name}');
//    });
//  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    updateAddressTextView(Strings.loading);
  }

  void GoBack() {
    Navigator.of(context).pop(true);
  }


  click() {
    Navigator.pop(context, MapData(this.locality,this.throughput, this.featurename, this.lat, this.lng));
  }

  void _getLocationPermission() async {

    Future<PermissionStatus> status =
    PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    status.then((PermissionStatus status) {
      setState(() {

      });
    });

    final PermissionHandler _permissionHandler = PermissionHandler();
    var permissionStatus = await _permissionHandler.checkPermissionStatus(PermissionGroup.location);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        break;
      case PermissionStatus.denied:
        showErrorMessage(context, "Please give the location");
        break;
      case PermissionStatus.disabled:
      // do something
        break;
      case PermissionStatus.restricted:
      // do something
        break;
      case PermissionStatus.unknown:
      // do something
        break;
      default:
    }
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


  void _onCameraIdle() async {
      updateAddressTextView(Strings.loading);

      final coordinates = new Coordinates(
          _lastMapPosition.latitude, _lastMapPosition.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      var first = addresses.first;
      var address = first.addressLine.split(',');
      print(address[0]);
      print(address[1]);
      throughput = first.thoroughfare;
      locality = first.locality;
      featurename = first.featureName;
      lat = _lastMapPosition.latitude;
      lng = _lastMapPosition.longitude;


      updateAddressTextView(address[0] + ", \n" + address[1]);

      print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');


  }

  Future<void> _goToCurrentLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _kLake = CameraPosition(
        bearing: 0,
        target: LatLng(latitude, longitude),
        tilt: 0,
        zoom: 18.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  updateAddressTextView(String address) {
    setState(() {
      text = address;
    });
  }

}
