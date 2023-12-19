import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/routing/router.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final status =
        ref.watch(authRepositoryProvider.select((value) => value.status));
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Page'),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(AuthRoute());
              },
              child:
                  Text(status == AuthStatus.authenticated ? 'LogOut' : 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}
