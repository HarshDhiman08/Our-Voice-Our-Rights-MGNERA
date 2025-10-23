import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/mgnrega_model.dart';

class PerformanceChart extends StatelessWidget {
  final List<MgnregaData> data;
  final double height;

  const PerformanceChart({super.key, required this.data, this.height = 200});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(child: Text("No chart data")),
      );
    }

    final bars = data.asMap().entries.map((e) {
      final idx = e.key;
      final value = e.value.personDaysGenerated.toDouble();
      return BarChartGroupData(x: idx, barRods: [
        BarChartRodData(toY: value, width: 18),
      ]);
    }).toList();

    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          barGroups: bars,
          alignment: BarChartAlignment.spaceBetween,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, meta) {
                  final idx = v.toInt();
                  if (idx < 0 || idx >= data.length) return const SizedBox();
                  return Text(
                    data[idx].month,
                    style: const TextStyle(fontSize: 10),
                  );
                },
                reservedSize: 30,
                interval: 1,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }
}
