import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/mgnrega_model.dart';
import 'package:fl_chart/fl_chart.dart';

class DistrictDetailScreen extends StatelessWidget {
  final MgnregaData districtData;
  const DistrictDetailScreen({super.key, required this.districtData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          districtData.district_name.isNotEmpty
              ? districtData.district_name
              : "District Details",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffF6FBF6), Color(0xffFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _summaryCard(),
              const SizedBox(height: 16),
              _persondaysChartCard(),
              const SizedBox(height: 16),
              _womenCard(),
              const SizedBox(height: 16),
              _economicCard(),
              const SizedBox(height: 16),
              _labourCard(),
              const SizedBox(height: 16),
              _infoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryCard() {
    return _buildCard(
      title: "District Overview",
      color: Colors.white,
      child: Column(
        children: [
          _statRow("State", districtData.state_name),
          _statRow("Financial Year", districtData.fin_year),
          _statRow("Month", districtData.month),
          _statRow("Households Worked", "${districtData.Total_Households_Worked}"),
          _statRow("Persondays Generated",
              "${districtData.personDaysGenerated.toStringAsFixed(0)}"),
        ],
      ),
    );
  }

  Widget _persondaysChartCard() {
    final y = districtData.personDaysGenerated;
    final double maxY = y + (y * 0.2);

    return _buildCard(
      title: "Work Done (Persondays Generated)",
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(top: 10), 
              child: BarChart(
                BarChartData(
                  maxY: maxY,
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: y,
                          width: 26,
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ],
                      showingTooltipIndicators: [0],
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 50,
                        showTitles: true,
                        interval: y > 100000 ? y / 4 : 25000,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Text(
                              "${(value / 1000).toStringAsFixed(0)}k",
                              style: const TextStyle(fontSize: 11),
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            districtData.month.isNotEmpty
                                ? districtData.month
                                : "Month",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${districtData.personDaysGenerated.toStringAsFixed(0)} total persondays generated",
            style: GoogleFonts.poppins(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _womenCard() {
    final rate = districtData.womenParticipationRate;
    return _buildCard(
      title: "Women Participation Rate",
      color: Colors.pink.shade50,
      child: Row(
        children: [
          const Icon(Icons.woman, color: Colors.pink, size: 38),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Active participation of women workers",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              "${rate.toStringAsFixed(1)}%",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade700,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _economicCard() {
    return _buildCard(
      title: "Expenditure Overview",
      color: Colors.blue.shade50,
      child: Column(
        children: [
          _statRow("Total Expenditure", "₹${districtData.Total_Exp.toStringAsFixed(2)}"),
          _statRow("Material & Skilled Wages",
              "₹${districtData.Material_and_skilled_Wages.toStringAsFixed(2)}"),
          _statRow("Administrative Expenditure",
              "₹${districtData.Total_Adm_Expenditure.toStringAsFixed(2)}"),
          _statRow("Avg Wage Rate (per day)", "₹${districtData.Average_Wage_rate_per_day_per_person.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _labourCard() {
    return _buildCard(
      title: "Labour & Work Statistics",
      color: Colors.orange.shade50,
      child: Column(
        children: [
          _statRow("Completed Works", "${districtData.Number_of_Completed_Works}"),
          _statRow("Ongoing Works", "${districtData.Number_of_Ongoing_Works}"),
          _statRow("Total Job Cards Issued", "${districtData.Total_No_of_JobCards_issued}"),
          _statRow("Active Job Cards", "${districtData.Total_No_of_Active_Job_Cards}"),
          _statRow("Avg Days of Employment", "${districtData.Average_days_of_employment_provided_per_Household}"),
        ],
      ),
    );
  }

  Widget _infoCard() {
    return _buildCard(
      title: "What do these numbers mean?",
      color: Colors.teal.shade50,
      child: Text(
        "• 'Households' represents how many homes received work.\n\n"
            "• 'Persondays' refers to the total number of working days generated.\n\n"
            "• 'Women Participation Rate' shows the contribution of women workers.\n\n"
            "• 'Total Expenditure' covers all wages and material costs for works.\n\n"
            "• 'Avg Wage Rate' indicates average payment per worker per day.",
        style: GoogleFonts.poppins(fontSize: 13, height: 1.5),
      ),
    );
  }


  Widget _buildCard({required String title, required Widget child, Color? color}) {
    return Card(
      elevation: 4,
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(height: 10),
          child,
        ]),
      ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green.shade800),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
