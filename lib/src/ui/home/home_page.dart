import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';
import 'package:pgrkam/src/routing/router.dart';
import 'package:pgrkam/src/ui/home/widgets/dashboard_page.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';
import '../../models/responses/user_data.dart';
// import 'package:pgrkam/src/utils/color_utils.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Future.delayed(Duration.zero, () {});
  }

  @override
  Widget build(BuildContext context) {
    final userData =
        ref.watch(authRepositoryProvider.select((value) => value.authUser));
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hey Ayush!',
                    style: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (userData?.role != UserRole.admin)
                    GestureDetector(
                      onTap: () {
                        context.navigateTo(const ProfileRoute());
                      },
                      child: const Icon(
                        CupertinoIcons.person_alt_circle,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : Colors.transparent;
                  },
                ),
                indicatorColor: primaryColor,
                isScrollable: false,
                labelColor: primaryColor,
                labelStyle: GoogleFonts.outfit(
                  fontSize: 18,
                ),
                tabs: [
                  Tab(
                    height: 40,
                    child: Text('Dashboard'),
                  ),
                  Tab(
                    height: 40,
                    child: Text('Reports'),
                  )
                ],
                controller: _tabController,
              ),
            ),
            Expanded(child: const DashboardPage()),
          ],
        ),
      ),
    );
  }
}
