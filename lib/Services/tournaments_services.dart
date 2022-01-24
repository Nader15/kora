import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kora/Models/tournaments_model.dart';
import 'package:kora/Utils/statics.dart';

class TournamentsServices {
  static Future<List<TournamentsModel>> getTournaments() async {
    var response = await http.get(
      Uri.parse("$apiUrl/products"),
    );
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return tournamentsModelFromJson(jsonData);
    } else
      return throw Exception("Failed to load tournaments");
  }
}
