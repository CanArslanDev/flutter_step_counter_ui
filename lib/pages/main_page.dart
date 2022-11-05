import 'package:flutter/material.dart';
import 'package:step_counter/classes/pedometer_count.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:path/path.dart'; //used to join paths
import 'dart:io';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 39,
        ),
      ),
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 4),
            child: GestureDetector(
              onTap: (() {
                Scaffold.of(context).openDrawer();
              }),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(-1, -1), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monday,24 August,2020",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(
              "Daily Activity",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          daysRow(width),
          Padding(padding: EdgeInsets.only(top: 60)),
          circleBar("10,189", "Step Count", "Step Goal: 20,000", width),
          const Padding(padding: EdgeInsets.only(top: 100)),
          istaticsRow(width),
        ],
      ),
    );
  }

  istaticsRow(double width) {
    return Center(
      child: Container(
        width: width - 60,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(-3, -3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(3, 6), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            istatics("Distance", "7.76", "Km"),
            istaticsDivider(),
            istatics("Time", "2.40", ""),
            istaticsDivider(),
            istatics("Heart", "92", "bpm"),
          ],
        ),
      ),
    );
  }

  istaticsDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 2,
        height: 30,
        color: Colors.grey.shade600,
      ),
    );
  }

  istatics(String title, String value, String value2) {
    return Container(
      width: 95,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16.5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(left: 7)),
                Text(
                  value2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  daysRow(double width) {
    return Center(
      child: Container(
        width: width - 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(-3, -3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(3, 6), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            days("Thu", "20"),
            days("Fri", "21"),
            days("Sat", "22"),
            days("Sun", "23"),
            days("Mon", "24"),
          ],
        ),
      ),
    );
  }

  days(String title, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  circleBar(
      String stepCount, String stepCountTitle, String stepGoal, double width) {
    return Container(
      width: width - 150,
      height: width - 150,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
            startAngle: -90,
            endAngle: 360,
            showTicks: false,
            showLabels: false,
            axisLineStyle: AxisLineStyle(thickness: 15),
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 360,
                  color: Color(0xFF3b3a3b),
                  startWidth: 15,
                  endWidth: 15),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                  value: 840,
                  width: 15,
                  color: Colors.white,
                  enableAnimation: true,
                  cornerStyle: CornerStyle.bothCurve)
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Column(
                    children: [
                      Text(stepCount,
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(stepCountTitle,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.only(top: 25)),
                      Text(stepGoal,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          )),
                    ],
                  )),
                  angle: 90,
                  positionFactor: 0.7)
            ])
      ]),
    );
  }
}
