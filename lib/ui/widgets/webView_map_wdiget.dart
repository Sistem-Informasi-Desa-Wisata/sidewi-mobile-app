import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
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
                  var map = L.map('map').setView([-8.469611, 115.238528], 13);
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
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
