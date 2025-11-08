import 'package:http/http.dart' as http;
import 'dart:convert';

class TimezoneProvider {
  static Future<Map<String, dynamic>?> getTime(String timezone) async {
    final url = Uri.parse(
      'https://timeapi.io/api/time/current/zone?timeZone=Asia%2FPhnom_Penh',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print('⚠️ Failed to load: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('❌ Error loading time: $e');
      return null;
    }
  }
}
