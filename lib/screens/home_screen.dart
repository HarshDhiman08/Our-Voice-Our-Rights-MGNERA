import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/district_provider.dart';
import '../services/api_service.dart';
import '../models/mgnrega_model.dart';
import 'district_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedState = ApiService.indianStates.isNotEmpty
      ? ApiService.indianStates.first
      : "Unknown";
  String selectedYear = "2024-2025";

  final List<String> years = [
    "2024-2025",
    "2023-2024",
    "2022-2023",
    "2021-2022"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DistrictProvider>(context, listen: false)
          .loadDistrictData(selectedState, finYear: selectedYear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DistrictProvider>(context);
    final states = ApiService.indianStates;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Our Voice, Our Rights",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔽 Dropdown Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: states.contains(selectedState)
                        ? selectedState
                        : states.first,
                    decoration: const InputDecoration(
                      labelText: "Select State",
                      border: OutlineInputBorder(),
                    ),
                    items: states
                        .map((state) => DropdownMenuItem(
                      value: state,
                      child:
                      Text(state, overflow: TextOverflow.ellipsis),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => selectedState = value);
                      provider.loadDistrictData(selectedState,
                          finYear: selectedYear);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: years.contains(selectedYear)
                        ? selectedYear
                        : years.first,
                    decoration: const InputDecoration(
                      labelText: "Select Year",
                      border: OutlineInputBorder(),
                    ),
                    items: years
                        .map((y) =>
                        DropdownMenuItem(value: y, child: Text(y)))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => selectedYear = value);
                      provider.loadDistrictData(selectedState,
                          finYear: selectedYear);
                    },
                  ),
                ),
              ],
            ),
          ),

          // 🔽 Loading Indicator
          if (provider.isLoading) const LinearProgressIndicator(),

          // 🔽 List Section
          Expanded(
            child: provider.errorMessage != null && provider.data.isEmpty
                ? Center(
              child: Text(
                provider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            )
                : provider.data.isEmpty
                ? const Center(child: Text("No data available"))
                : RefreshIndicator(
              onRefresh: () => provider.loadDistrictData(
                  selectedState,
                  finYear: selectedYear),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: provider.data.length,
                itemBuilder: (context, index) {
                  final MgnregaData d = provider.data[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        d.district_name.isNotEmpty
                            ? d.district_name
                            : "Unnamed District",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      // ✅ FIXED OVERFLOW: Wrapped Row in SingleChildScrollView
                      subtitle: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Chip(
                              label: Text(
                                "Persondays: ${d.personDaysGenerated.toStringAsFixed(0)}",
                                style: const TextStyle(
                                    color: Colors.white),
                              ),
                              backgroundColor:
                              Colors.orange.shade700,
                            ),
                            const SizedBox(width: 8),
                            Chip(
                              label: Text(
                                "Households: ${d.Total_Households_Worked}",
                                style: const TextStyle(
                                    color: Colors.white),
                              ),
                              backgroundColor:
                              Colors.blue.shade600,
                            ),
                          ],
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 18,
                      ),
                      onTap: () {
                        if (d.district_name.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DistrictDetailScreen(
                                  districtData: d),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                              Text("Invalid district data"),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
