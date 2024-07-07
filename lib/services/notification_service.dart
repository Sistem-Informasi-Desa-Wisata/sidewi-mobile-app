import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/response/notification_response_model.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';

class NotificationService {
  Future<List<Notification>> fetchNotificationsForAccount(int accountId) async {
    final url = Uri.parse('${ApiConfig.baseUrl}notifikasi/akun/$accountId');
    final response =
        await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Notification> notifications = body.map((dynamic item) {
        return Notification.fromJson(item);
      }).toList();

      return notifications;
    } else {
      throw Exception('Failed to load notifications');
    }
  }
}
