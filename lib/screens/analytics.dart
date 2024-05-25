import 'package:flutter/material.dart';
import 'package:ipd/pages/homePage.dart';
import 'package:pie_chart/pie_chart.dart';

class AnalyticsPage extends StatelessWidget {
  final Map<String, double> dataMap = {
    "!": 5,
    "?": 3,
    ",": 2,
    ".": 1,
  };

  final colorList = <Color>[
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50, // Set the background color
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // AppBar with a transparent background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.black),
          onPressed: () {
            // Go to home logic
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              // Replace with your image
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          SizedBox(width: 16), // For padding
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Track your progress here',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '70%',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.all(24),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                baseChartColor: Colors.grey[300]!,
                colorList: colorList, // Use the colorList defined above
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                legendOptions: LegendOptions(
                  showLegends: true,
                  legendShape:
                      BoxShape.circle, // To show legend labels as circle
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'NOTE:\nYour grammar is weak in sentences using comma. Kindly go through the punctuation guide or do more self practice.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.book, color: Colors.black),
                  onPressed: () {
                    // Go to punctuation guide logic
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.black),
                  onPressed: () {
                    // Go to self practice logic
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
