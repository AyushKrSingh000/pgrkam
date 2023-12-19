import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pgrkam/src/utils/toast_utils.dart';

import '../auth_page_model.dart';
import 'widgets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () async {
                      if (!isProcessing) {
                        setState(() {
                          isProcessing = true;
                        });
                        final res = await ref
                            .read(authPageModelProvider.notifier)
                            .login();
                        if (res != '') {
                          showErrorMessage(context, res);
                        } else {
                          showSuccessMessage(
                              context, 'Logged in successfully!');
                        }
                        if (mounted) {
                          setState(() {
                            isProcessing = false;
                          });
                        }
                      }
                    },
                    isProcessing: isProcessing,
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
