import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Text('Applied Jobs List'),
          ],
        ),
      ),
    );
  }
}
