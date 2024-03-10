import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    // String uri =
    //     ;
    // print(latitude);
    // print(longitude);
    // print(url);
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(jsonDecode(data)['name']);
      return jsonDecode(data);

      // double temperature = decodedData['main']['temp'];
      // int condition = decodedData['weather'][0]['id'];
      // String cityName = decodedData['name'];

      // print(temperature);
      // print(condition);
      // print(cityName);
    } else {
      print(response.statusCode);
    }
  }
}
