import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:books_store_app/style/app_theme.dart';

class ChartBullets extends StatelessWidget {
  ChartBullets({required this.listOfColors, required this.listOfTitle});

  final List<Color> listOfColors;
  final List listOfTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      // The fake list you use should contain elements more than elements in colors
      ...listOfColors.map((value) {
        var index = listOfColors.indexOf(value);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: defSpacing / 4),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: defSpacing * .75),
                Container(
                  color: Color.fromARGB(
                    value.alpha,
                    value.red,
                    value.green,
                    value.blue,
                  ),
                  width: defSpacing,
                  height: defSpacing,
                ),
                SizedBox(width: defSpacing * .75),
                Text(listOfTitle[index].name ?? 'Unknown',
                    style: TextStyle(color: Colors.white)),
              ]),
        );
      }).toList()
    ]));
  }
}

class Chart extends StatelessWidget {
  Chart(
      {required this.mainItems,
      required this.radius,
      required this.colors,
      required this.title});

  final List<Color> colors;
  final List<double> radius;
  final List mainItems;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Stack(children: [
          PieChart(PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: myPieChartList(colors, radius))),
          Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Top',
                    style: kBookNameStyle.copyWith(color: Colors.white)),
                SizedBox(height: defSpacing / 4),
                Text(title,
                    style: kSignTitleStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 24)),
              ]))
        ]));
  }

  List<PieChartSectionData> myPieChartList(
      List<Color> colors, List<double> radius) {
    List<PieChartSectionData> paiChartSelectionData = [];
    mainItems.forEach((element) {
      int index = mainItems.indexOf(element);
      paiChartSelectionData.add(PieChartSectionData(
          color: colors[index], showTitle: false, radius: radius[index]));
    });
    return paiChartSelectionData;
  }
}
