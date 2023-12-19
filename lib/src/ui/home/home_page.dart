import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';
import 'package:pgrkam/src/routing/router.dart';
import 'package:pgrkam/src/ui/home/widgets/dashboard.dart';

import 'package:pgrkam/src/ui/home/widgets/user_home_page.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';

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
                    'Hey ${userData != null ? userData.userName : "Admin!"}',
                    style: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // if (!(userData == null || userData.role == 'applicant'))
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(const AdminProfileRoute());
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
            // if (!(userData != null && userData.role != 'applicant')) ...[
            const Expanded(child: const DashBoard()),
            // ] else ...[
            // const UserHomePage(),
            // ]
          ],
        ),
      ),
    );
  }
}
