import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/crop_stat.dart';
import '../../utils/app_text.dart';

class CropDistributionBarChart extends StatelessWidget {
  final List<CropStat> data;

  const CropDistributionBarChart({
    super.key,
    required this.data,
  });

  String _getCropLabel(String key) {
    switch (key) {
      case 'rice':
        return AppText.rice;
      case 'wheat':
        return AppText.wheat;
      case 'maize':
        return AppText.maize;
      default:
        return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 100,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final index = value.toInt();
                if (index < 0 || index >= data.length) {
                  return const SizedBox();
                }
                return Text(
                  _getCropLabel(data[index].cropKey),
                  style: const TextStyle(fontSize: 12),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(data.length, (index) {
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: data[index].quantity,
                width: 22,
                borderRadius: BorderRadius.circular(6),
                color: Colors.green,
              ),
            ],
          );
        }),
      ),
    );
  }
}
