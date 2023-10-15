// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class SendNotification {
  static var SERVER_KEY = "AAAA7YAEEhg:APA91bEjM4cheMgQCFWQ4bJHYelQ6KdM45XVbdYQDQB-y4dDaci_odqz0jK6YpV9tIxQ2X8YsdWtyzrMslQvqcDnX_YjYJsAaWgUiGKacHvbgzTFayC2VwrSwiZ559YNoXW7YzRsZQhl";

  static sendMessageNotification(String token, String title, String body, Map<String, dynamic>? payload) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$SERVER_KEY',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': body, 'title': title},
          'priority': 'high',
          'data': payload ?? <String, dynamic>{},
          'to': token
        },
      ),
    );
  }
}
