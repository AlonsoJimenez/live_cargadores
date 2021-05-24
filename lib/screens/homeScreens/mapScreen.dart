import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_cargadores/screens/homeScreens/objects.dart';
import 'package:url_launcher/url_launcher.dart';

class mapScreen extends StatefulWidget {
  @override
  State<mapScreen> createState() => mapScreenState();
}

class mapScreenState extends State<mapScreen> {
  String wazeUrl(double lat, double lng) {
    return 'https://waze.com/ul?ll=${lat},${lng}&z=10';
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(9.854784, -83.907211);

  final Map<String, Marker> myChargers = {};

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      for (final chargerVar in testChargers) {
        final marker = Marker(
            position:
                LatLng(chargerVar.localization[0], chargerVar.localization[1]),
            visible: chargerVar.active,
            icon: chargerVar.occupied
                ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
                : BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
            markerId: MarkerId(chargerVar.localization.toString()),
            infoWindow: InfoWindow(
                title: chargerVar.owner,
                snippet: "Referencia: " +
                    chargerVar.reference +
                    " Servicios: " +
                    chargerVar.otherServices,
                onTap: () => {
                      _launchURL(wazeUrl(chargerVar.localization[0],
                          chargerVar.localization[1]))
                    }));
        myChargers[chargerVar.localization.toString()] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        buildingsEnabled: false,
        markers: myChargers.values.toSet(),
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
