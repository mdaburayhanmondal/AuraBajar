import 'dart:async';

import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_heading.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_otp_field.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.address});
  final String address;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otp = "";
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer?.cancel();
    seconds = 60;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuraHeading(text: "Verify OTP"),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        AuraSubtitle(subtitle: "Enter the 6 digit OTP sent to"),
                        Text(
                          widget.address,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    AuraOtpField(
                      length: 6,
                      onChanged: (value) {
                        otp = value;
                        setState(() {});
                      },
                      onCompleted: (code) {
                        otp = code;
                        setState(() {});
                      },
                      autofillHints: const [AutofillHints.oneTimeCode],
                    ),
                    SizedBox(height: 40),
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuraSubtitle(subtitle: "Didn't receive OTP?"),
                        AuraLinkedText(
                          text: "Resend OTP",
                          onTap: seconds == 0
                              ? () {
                                  print("OTP resent");
                                  startTimer();
                                }
                              : null,
                        ),
                      ],
                    ),
                    Text("(${seconds.toString().padLeft(2, '0')})"),
                    SizedBox(height: 50),
                    AuraButton(
                      onPressed: otp.length == 6
                          ? () {
                              print(otp);
                            }
                          : null,
                      text: "Verify OTP",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
