import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../auth_page_model.dart';
import 'widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const TitleDescription(
                    title: 'Sign In',
                    description: 'Sign up to apply for jobs',
                  ),
                  const SizedBox(height: 30),
                  const EmailTextField(),
                  const SizedBox(height: 15),
                  const PasswordTextField(),
                  const SizedBox(height: 25),
                  Cta(
                    label: 'Sign In',
                    onPressed: () {},
                    isProcessing: ref.watch(
                      authPageModelProvider.select(
                        (_) => _.status == AuthPageStatus.processing,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
