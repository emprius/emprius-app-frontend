import 'package:empriusapp/src/features/activity/data/user_activity_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityBarchart extends StatelessWidget {
  final double barWidth = 15;

  @override
  Widget build(BuildContext context) => BarChart(
    swapAnimationDuration: Duration(milliseconds: 150),
    swapAnimationCurve: Curves.linear,

    BarChartData(
      alignment: BarChartAlignment.center,
      maxY: 20,
      minY: 0,
      groupsSpace: 12,

      barGroups: BarData.userActivityCount.map(
            (data) => BarChartGroupData(
              x: data.id,
              barsSpace: 2,
              barRods: [
                BarChartRodData(
                  toY: data.bookingCount,
                  width: barWidth,
                  color: const Color(0xFF616200),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  )
              ),
                BarChartRodData(
                  toY: data.requestCount,
                  width: barWidth,
                  color:  const Color(0xFF3D6657),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  )
              ),
              ],),
      ).toList(),

     titlesData: FlTitlesData(
         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
       //show: true,
       bottomTitles: AxisTitles(
         sideTitles: SideTitles(
           reservedSize: 20,
           showTitles: true,
           getTitlesWidget: bottomTitleWidget,
         )
       )
     ),

      /*  gridData: FlGridData(
        checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
        getDrawingHorizontalLine: (value) {
          if (value == 0) {
            return FlLine(
              color: const Color(0xff363753),
              strokeWidth: 3,
            );
          } else {
            return FlLine(
              color: const Color(0xff2a2747),
              strokeWidth: 0.8,
            );
          }
        },
      ),*/
    ),
  );
}


Widget bottomTitleWidget(double id, TitleMeta title){
  String text = BarData.userActivityCount
      .firstWhere((element) => element.id == id.toInt())
      .name;
 return Text(text);
}
