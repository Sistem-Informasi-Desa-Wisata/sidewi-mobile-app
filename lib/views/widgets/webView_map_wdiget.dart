import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {
  final String maps; // Coordinate string in the format "latitude,longitude"
  const MapPage({super.key, required this.maps});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late WebViewController _controller;
  bool _hasError = false;

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Split the coordinates string and format it for JavaScript
    List<String> coords = widget.maps.split(',').map((s) => s.trim()).toList();
    String jsCoords = '[${coords[0]}, ${coords[1]}]';
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=-8.400862980803357,115.21842560228728');

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Map View'),
      // ),
      body: Center(
        child: _hasError
            ? Text('Failed to load the map. Please try again later.')
            : Stack(children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: WebView(
                    initialUrl: Uri.dataFromString(
                      '''
                    <!DOCTYPE html>
                    <html>
                    <head>
                      <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
                      <meta charset="utf-8">
                      <title>Simple Map</title>
                      <style>
                        html, body, #map {
                          height: 100%;
                          margin: 0;
                          padding: 0;
                        }
                      </style>
                      <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                      <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
                    </head>
                    <body>
                      <div id="map"></div>
                      <script>
                        var coords = ${jsCoords};
                        var map = L.map('map').setView(coords, 13);
                        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                          maxZoom: 19,
                        }).addTo(map);
                      </script>
                    </body>
                    </html>
                    ''',
                      mimeType: 'text/html',
                      encoding: Encoding.getByName('utf-8'),
                    ).toString(),
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller = webViewController;
                    },
                    onPageFinished: (String url) {
                      setState(() {
                        _hasError = false;
                      });
                    },
                    onWebResourceError: (WebResourceError error) {
                      setState(() {
                        _hasError = true;
                      });
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrl(url);
                  },
                  child: Container(
                    color: Colors
                        .transparent, // Ensure the GestureDetector is tappable
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ]),
      ),
    );
  }
}

// open map
class MapUtils {
  MapUtils._();

  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String gooleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(gooleMapUrl)) {
      await launch(gooleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
