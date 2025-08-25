import "dart:convert";

import "package:http/http.dart" as http;

class ApiService {
  static Future<Map<String, dynamic>> getwheatherfromapi() async {
    // String cityName = "London";
    String apikey = "df759cc8c04755f037f2bf6a94b27f0d";
    // String ukshort = "uk";
    String indiacityName = "Delhi";
    String indianshort = "in";
    try {
      final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$indiacityName,$indianshort&APPID=$apikey",
      );
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
