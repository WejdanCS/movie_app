import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String apiKey = dotenv.env['API_KEY'] ?? "";
}
