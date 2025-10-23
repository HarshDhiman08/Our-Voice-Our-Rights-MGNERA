import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mgnrega_model.dart';

class ApiService {
  static const String apiKey = "579b464db66ec23bdd000001a8b0478a293c4ea051bdcbc7014cb14a";
  static const String baseUrl = "https://api.data.gov.in/resource/ee03643a-ee4c-48c2-ac30-9f2ff26ab722";

  static const List<String> indianStates = [
    "ANDHRA PRADESH",
    "ARUNACHAL PRADESH",
    "ASSAM",
    "BIHAR",
    "CHHATTISGARH",
    "GOA",
    "GUJARAT",
    "HARYANA",
    "HIMACHAL PRADESH",
    "JHARKHAND",
    "KARNATAKA",
    "KERALA",
    "MADHYA PRADESH",
    "MAHARASHTRA",
    "MANIPUR",
    "MEGHALAYA",
    "MIZORAM",
    "NAGALAND",
    "ODISHA",
    "PUNJAB",
    "RAJASTHAN",
    "SIKKIM",
    "TAMIL NADU",
    "TELANGANA",
    "TRIPURA",
    "UTTAR PRADESH",
    "UTTARAKHAND",
    "WEST BENGAL",
    "ANDAMAN & NICOBAR ISLANDS",
    "CHANDIGARH",
    "DADRA & NAGAR HAVELI AND DAMAN & DIU",
    "DELHI",
    "JAMMU & KASHMIR",
    "LADAKH",
    "LAKSHADWEEP",
    "PUDUCHERRY"
  ];

  Future<List<MgnregaData>> fetchDistrictData(String stateName, {String finYear = "2024-2025", int limit = 100}) async {
    final stateFilter = Uri.encodeComponent(stateName);
    final url = Uri.parse("$baseUrl?api-key=$apiKey&format=json&offset=0&limit=$limit&filters[state_name]=$stateFilter&filters[fin_year]=$finYear");

    final response = await http.get(url, headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final records = body["records"] as List<dynamic>?;
      if (records == null || records.isEmpty) return [];
      return records.map((e) => MgnregaData.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception("API error: ${response.statusCode}");
    }
  }
}
