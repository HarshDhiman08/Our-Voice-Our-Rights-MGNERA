import 'package:flutter/material.dart';
import '../models/mgnrega_model.dart';
import '../services/api_service.dart';
import '../services/cache_service.dart';

class DistrictProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<MgnregaData> _data = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MgnregaData> get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadDistrictData(String stateName, {String finYear = "2024-2025"}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await CacheService.init();
      final cacheKey = "$stateName|$finYear";
      final cached = CacheService.getCachedData(cacheKey);
      if (cached != null && cached is List<dynamic>) {
        _data = cached.map((e) => MgnregaData.fromJson(Map<String, dynamic>.from(e))).toList();
        _isLoading = false;
        notifyListeners();
      }

      final results = await _apiService.fetchDistrictData(stateName, finYear: finYear, limit: 200);

      if (results.isEmpty) {
        _errorMessage = "No data found for $stateName in $finYear";
        _data = results;
      } else {
        _data = results;
        final serialized = results.map((r) {
          return {
            "fin_year": r.fin_year,
            "month": r.month,
            "state_code": r.state_code,
            "state_name": r.state_name,
            "district_code": r.district_code,
            "district_name": r.district_name,
            "persondays": r.Persondays_of_Central_Liability_so_far,
            "households_worked": r.Total_Households_Worked,
            "individuals_worked": r.Total_Individuals_Worked,
            "women_persondays": r.womenParticipationRate,
          };
        }).toList();
        await CacheService.saveData(cacheKey, serialized);
      }
    } catch (e) {
      if (_data.isEmpty) {
        _errorMessage = "Error fetching data: ${e.toString()}";
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearData() {
    _data = [];
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}
