import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/constants/colors.dart';

import '../../routing/router.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToMainPageAfterDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 105),
            Center(
              child: Text(
                'PGRKAM WEB\nAPPLICATION',
                style: GoogleFonts.outfit(
                  fontSize: 26,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  // color: const Color(0xFFFDCA50),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Text(
                'Loading...',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }

  /// navigates the user to Main page after a delay
  _navigateToMainPageAfterDelay() async {
    final router = context.router;

    await Future.delayed(const Duration(milliseconds: 2000));
    router.replace(const MainRoute());
  }
}
