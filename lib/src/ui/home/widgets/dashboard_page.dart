import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/widgets/line_chart_section.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final count = List<int>.generate(30, (i) => i);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 5,
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Users in last 30 minutes',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '1',
                          style: GoogleFonts.outfit(
                            fontSize: 28,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          // color: Colors.black,
                          width: 230,
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: BarChart(
                              BarChartData(
                                borderData: FlBorderData(
                                  show: false,
                                ),

                                titlesData: FlTitlesData(
                                  rightTitles: AxisTitles(),
                                  topTitles: AxisTitles(),
                                  bottomTitles: AxisTitles(),
                                ),
                                backgroundColor: Colors.black,
                                gridData: FlGridData(
                                  drawHorizontalLine: false,
                                  show: false,
                                ),
                                barGroups: [
                                  ...count.map(
                                    (e) => BarChartGroupData(
                                      x: e,
                                      groupVertically: true,
                                      barRods: [
                                        BarChartRodData(
                                          toY: Random().nextDouble() *
                                              25.truncate(),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ],
                                      // color: Colors.red,
                                    ),
                                  ),
                                ],
                                // centerSpaceRadius: 15,
                                // read about it in the PieChartData section
                              ),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 150), // Optional
                              swapAnimationCurve: Curves.linear, // Optional
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Patiala'),
                              Text('9.1k'),
                              Text('Rajpura'),
                              Text('1.1k'),
                              Text('Ambala'),
                              Text('2k'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 5,
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User activity over time',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 150,
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: 30,
                                  title: 'Patiala',
                                  color: Colors.amber,
                                ),
                                PieChartSectionData(
                                  value: 100,
                                  title: 'Rajpura',
                                  color: Colors.lime,
                                ),
                                PieChartSectionData(
                                  value: 60,
                                  title: 'Ambala',
                                  color: Colors.pinkAccent,
                                ),
                              ],
                              centerSpaceRadius: 30,
                              // read about it in the PieChartData section
                            ),
                            swapAnimationDuration:
                                const Duration(milliseconds: 150), // Optional
                            swapAnimationCurve: Curves.linear, // Optional
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyHomePage(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
