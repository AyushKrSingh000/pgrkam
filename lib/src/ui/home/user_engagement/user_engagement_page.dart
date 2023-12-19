import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../demographic/dropdown_filter.dart';

class UserEngagementPage extends ConsumerStatefulWidget {
  const UserEngagementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserEngagementPageState();
}

class _UserEngagementPageState extends ConsumerState<UserEngagementPage> {
  int selectedFilter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text('User Engagement'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Filter : '),
                  CustomDropDownButton<int>(
                    selectedId: selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value;
                      });
                    },
                    data: const [
                      {1: "Page View"},
                      {2: "Govt. Jobs"},
                      {3: "Pvt. Jobs"},
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 150,
              child: selectedFilter != 1
                  ? Text(
                      'Based On Interest',
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : null,
            ),
            if (selectedFilter == 1) ...[
              SizedBox(
                width: 200,
                height: 150,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 30,
                        title: 'Home',
                        color: Colors.amber,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Jobs ',
                        color: Colors.lime,
                      ),
                      PieChartSectionData(
                        value: 60,
                        title: 'Applied Jobs',
                        color: Colors.blue,
                      ),
                      PieChartSectionData(
                        value: 30,
                        title: 'Search Jobs',
                        color: Colors.red,
                      ),
                    ],
                    centerSpaceRadius: 100,
                    // read about it in the PieChartData section
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
            ],
            if (selectedFilter == 2) ...[
              SizedBox(
                width: 200,
                height: 80,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 30,
                        title: 'Electrical',
                        color: Colors.amber,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Civil',
                        color: Colors.lime,
                      ),
                      PieChartSectionData(
                        value: 60,
                        title: 'Railways',
                        color: Colors.blue,
                      ),
                      PieChartSectionData(
                        value: 30,
                        title: 'Agriculture',
                        color: Colors.yellow,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Power',
                        color: Colors.orange,
                      ),
                      PieChartSectionData(
                        value: 20,
                        title: 'Others',
                        color: Colors.blueAccent,
                      ),
                      PieChartSectionData(
                        value: 20,
                        title: 'Software',
                        color: Colors.pink,
                      ),
                    ],
                    centerSpaceRadius: 100,
                    // read about it in the PieChartData section
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              Text(
                'User\'s interest',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 300,
                height: 280,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 20,
                        title: 'Electrical',
                        color: Colors.amber,
                      ),
                      PieChartSectionData(
                        value: 80,
                        title: 'Civil',
                        color: Colors.lime,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Railways',
                        color: Colors.blue,
                      ),
                      PieChartSectionData(
                        value: 10,
                        title: 'Agriculture',
                        color: Colors.yellow,
                      ),
                      PieChartSectionData(
                        value: 60,
                        title: 'Power',
                        color: Colors.orange,
                      ),
                      PieChartSectionData(
                        value: 20,
                        title: 'Others',
                        color: Colors.blueAccent,
                      ),
                      PieChartSectionData(
                        value: 300,
                        title: 'Software',
                        color: Colors.pink,
                      ),
                    ],
                    centerSpaceRadius: 100,
                    // read about it in the PieChartData section
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
            ],
            if (selectedFilter == 3)
              SizedBox(
                width: 200,
                height: 150,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 30,
                        title: 'Electrical',
                        color: Colors.amber,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Civil',
                        color: Colors.lime,
                      ),
                      PieChartSectionData(
                        value: 60,
                        title: 'IT SOftware',
                        color: Colors.blue,
                      ),
                      PieChartSectionData(
                        value: 30,
                        title: 'Sales Marketing',
                        color: Colors.yellow,
                      ),
                      PieChartSectionData(
                        value: 100,
                        title: 'Power',
                        color: Colors.orange,
                      ),
                      PieChartSectionData(
                        value: 20,
                        title: 'Others',
                        color: Colors.blueAccent,
                      ),
                    ],
                    centerSpaceRadius: 100,
                    // read about it in the PieChartData section
                  ),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
          ],
        ),
      ),
    );
  }
}
