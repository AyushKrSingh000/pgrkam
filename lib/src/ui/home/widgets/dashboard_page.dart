import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/demographic/demographic_page.dart';
import 'package:pgrkam/src/ui/home/user_engagement/user_engagement_page.dart';
import 'package:pgrkam/src/ui/home/widgets/line_chart_section.dart';

import '../../../logic/repositories/auth_repository/auth_repository.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // final applicantData = ref
    //     .watch(authRepositoryProvider.select((value) => value.applicantData));
    // print(applicantData);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Total Sign Ups'),
                          FittedBox(
                            child: Text(
                              '120k',
                              style: GoogleFonts.outfit(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              child: Text(
                                '+10',
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Active Users'),
                          FittedBox(
                            child: Text(
                              '-5',
                              style: GoogleFonts.outfit(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FittedBox(
                              child: Text(
                                '-500',
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DemographicInformationPage()));
              },
              child: Container(
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
                            'User Demographic\nInformation',
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/bar.png',
                        height: 120,
                        fit: BoxFit.cover,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyHomePage(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserEngagementPage()));
              },
              child: Container(
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
                        'User Engagement',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/pie.png',
                        height: 120,
                        fit: BoxFit.contain,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       width: 200,
                      //       height: 150,
                      //       child: PieChart(
                      //         PieChartData(
                      //           sections: [
                      //             PieChartSectionData(
                      //               value: 30,
                      //               title: 'Patiala',
                      //               color: Colors.amber,
                      //             ),
                      //             PieChartSectionData(
                      //               value: 100,
                      //               title: 'Rajpura',
                      //               color: Colors.lime,
                      //             ),
                      //             PieChartSectionData(
                      //               value: 60,
                      //               title: 'Ambala',
                      //               color: Colors.pinkAccent,
                      //             ),
                      //           ],
                      //           centerSpaceRadius: 30,
                      //           // read about it in the PieChartData section
                      //         ),
                      //         swapAnimationDuration:
                      //             const Duration(milliseconds: 150), // Optional
                      //         swapAnimationCurve: Curves.linear, // Optional
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
