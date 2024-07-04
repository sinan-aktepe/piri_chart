import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<ChartData> data = [
    ChartData(2000, 10.53, 3.3),
    ChartData(2004, 15.53, 3.3),
    ChartData(2010, 10.53, 3.3),
    ChartData(2011, 9.53, 5.3),
    ChartData(2012, 5.53, 2.3),
    ChartData(2013, 7.53, 9.3),
    ChartData(2014, 16.53, 13.3),
    ChartData(2015, 8.53, 15.3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    SplineAreaSeries<ChartData, int>(
                      dataSource: data,
                      cardinalSplineTension: 0,
                      splineType: SplineType.cardinal,
                      markerSettings: MarkerSettings(
                        isVisible: true,
                      ),
                      xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ]),
            ),
          ),
        ));
  }
}

class ChartData {
  final int x;
  final double y;
  final double y1;

  ChartData(this.x, this.y, this.y1);
}