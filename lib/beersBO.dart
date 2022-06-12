import 'dart:convert';
import 'beers.dart';
import 'package:http/http.dart' as http;

class BeersBO {
  Future<List<Beers>> fetchBeers() async {
    print("Fetch Beers");
    final response = await http
        .get(Uri.parse('https://stark-ridge-59896.herokuapp.com/typebeers'));

    print(response.statusCode);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      print(response.body);
      List<Beers> beers = l.map((i) => Beers.fromJson(i)).toList();
      return beers;
    } else {
      throw Exception('Failed to load Beers');
    }
  }
}
