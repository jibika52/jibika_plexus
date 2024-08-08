





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
void main() {
  return runApp(_ChartApp());
}
class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}
class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<_MyHomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('Jan', 12, 15),
      _ChartData('Feb', 15, 10),
      _ChartData('Mar', 30, 24),
      _ChartData('Apr', 6.4, 11),
      _ChartData('May', 60, 80),
      _ChartData('Jun', 80, 20),
      _ChartData('Jul', 30, 30),
      _ChartData('Aug', 30, 15),
      _ChartData('Sep', 80, 50),
      _ChartData('Oct', 100, 90),
      _ChartData('Nov', 80, 50),
      _ChartData('Dec', 60, 60),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,

          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: SfCartesianChart(
                    title: ChartTitle(
                        text: "Salary comparison Chart"
                    ),
                    borderWidth: 10,
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(

                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'Gold',
                          color: Color.fromRGBO(8, 142, 255, 1)),
                      LineSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y1,
                          name: 'Gold',
                          color: Color.fromRGBO(239, 9, 34, 1.0))
                    ]),
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
class _ChartData {
  _ChartData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}

