import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/ui/screens/login_screen.dart';
import 'package:sidewi_mobile_app/provider/storage_provider.dart';

class RouteGuard {
  static Future<bool> isAuthenticated() async {
    bool isLoggedIn = await checkToken();
    
    if (!isLoggedIn) {
      return false;
    }
    
    return true;
  }

  static RouteFactory onGenerateRoute(Widget Function(BuildContext, Map<String, dynamic>?) pageBuilder) {
    return (settings) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return FutureBuilder<bool>(
            future: isAuthenticated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData && snapshot.data!) {
                  return pageBuilder(context, settings.arguments as Map<String, dynamic>?);
                } else {
                  return LoginScreen(); 
                }
              }
            },
          );
        },
      );
    };
  }
}
