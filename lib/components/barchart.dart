import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VerticalBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text('?', style: TextStyle(fontSize: 25));
                      case 1:
                        return Text('!', style: TextStyle(fontSize: 25));
                      case 2:
                        return Text(',', style: TextStyle(fontSize: 25));
                      case 3:
                        return Text('.', style: TextStyle(fontSize: 25));
                      default:
                        return Text('');
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
            ),
            barGroups: [
              barGroup(0, 70, Colors.blue),
              barGroup(1, 85, Colors.green),
              barGroup(2, 65, Colors.orange),
              barGroup(3, 90, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData barGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barsSpace: 16,
      barRods: [
        BarChartRodData(
          toY: y,
          width:
              30, // Adjusted the width here to make the bars more rectangular
          color: color,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: color.withOpacity(0.2),
          ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              y,
              color,
              //TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
