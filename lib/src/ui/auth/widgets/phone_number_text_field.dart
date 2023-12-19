import '/src/ui/auth/auth_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextField extends ConsumerStatefulWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends ConsumerState<EmailTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).mobile,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setEmail(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,

        cursorColor: const Color(0xFF3886eb),
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 10,
            child: Center(
                // child: SvgPicture.asset(
                //   'assets/images/ic_indian-flag.svg',
                //   width: 24,
                // ),
                ),
          ),
          hintText: 'Enter email',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(58, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF1878f3).withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),

        // maxLength: 10,
      ),
    );
  }
}

class PasswordTextField extends ConsumerStatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(authPageModelProvider).mobile,
    );
    _controller.addListener(() {
      ref.read(authPageModelProvider.notifier).setPassword(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: _controller,
        cursorColor: const Color(0xFF3886eb),
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 10,
            child: Center(
                // child: SvgPicture.asset(
                //   'assets/images/ic_indian-flag.svg',
                //   width: 24,
                // ),
                ),
          ),
          hintText: 'Enter password',
          hintStyle: GoogleFonts.rubik(
            color: const Color(0XFF777777),
            fontSize: 15.5,
            letterSpacing: 0.1,
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          contentPadding: const EdgeInsets.fromLTRB(58, 18, 13, 18),
          filled: true,
          fillColor: const Color(0xFFf7f7f7),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFeeeeee),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF1878f3).withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        style: GoogleFonts.rubik(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF333333),
          letterSpacing: 1,
        ),
      ),
    );
  }
}
