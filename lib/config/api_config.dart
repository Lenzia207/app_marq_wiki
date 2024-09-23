import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String localUrl = dotenv.env['LOCAL_URL'] ?? '';
  static String submitInputUrl = dotenv.env['SUBMIT_INPUT'] ?? '';
}
