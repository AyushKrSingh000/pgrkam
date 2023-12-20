import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pgrkam/src/ui/home/demographic/dropdown_filter.dart';

import 'package:pgrkam/src/utils/toast_utils.dart';

import '../auth_page_model.dart';
import 'widgets.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignUpScreen> {
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(authPageModelProvider.select((_) => _.userType));
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                Text(
                  '''PUNJAB GHAR GHAR ROZGAR
    Department of Employment Generation,
    Skill Development & Training- Govt. Of Punjab, India
    ''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    // color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TitleDescription(
                  title: 'Sign Up',
                  description: 'Sign Up to apply for jobs',
                ),
                const SizedBox(height: 30),
                const NameTextField(),
                const SizedBox(height: 15),
                const EmailTextField(),
                const SizedBox(height: 15),
                const PasswordTextField(),
                const SizedBox(height: 15),
                const MobileTextField(),
                const SizedBox(height: 15),
                CustomDropDownButton(
                    selectedId: UserType.applicant == userType ? 1 : 2,
                    onChanged: (value) {
                      ref.read(authPageModelProvider.notifier).setRole(
                          value == 1 ? UserType.applicant : UserType.employer);
                    },
                    data: const [
                      {1: "Applicant"},
                      {2: "Employeer"}
                    ]),
                const SizedBox(height: 25),
                Cta(
                  label: 'Sign Up',
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
                        showSuccessMessage(context, 'Logged in successfully!');
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an  Account ?'),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        ref
                            .read(authPageModelProvider.notifier)
                            .setAuthScreenStatus(AuthScreen.signIn);
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
