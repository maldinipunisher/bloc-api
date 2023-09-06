import 'dart:convert';

class JsonParser {
  static String? tryEncode(data) {
    try {
      return jsonEncode(data);
    } catch (_) {
      return null;
    }
  }
  static Map<String, dynamic>? tryDecode(data) {
    try {
      return jsonDecode(data);
    } catch (_) {
      return null;
    }
  }
}
