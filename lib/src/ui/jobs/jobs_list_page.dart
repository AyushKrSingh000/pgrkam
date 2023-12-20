import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/widgets/user_home_page.dart';

import '../../logic/repositories/auth_repository/auth_repository.dart';

@RoutePage()
class JobsListPage extends ConsumerStatefulWidget {
  const JobsListPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _JobsListPageState();
}

class _JobsListPageState extends ConsumerState<JobsListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jobsList =
        ref.watch(authRepositoryProvider.select((value) => value.jobData));
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: jobsList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      " Jobs",
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: jobsList
                            .getRange(0, 50)
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: JobCard(jobData: e),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
