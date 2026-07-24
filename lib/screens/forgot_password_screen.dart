import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_heading.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_text_field.dart';
import 'package:aurabajar/screens/login_screen.dart';
import 'package:aurabajar/screens/otp_verification_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController inputController = TextEditingController();
  bool isPhone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                // main column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent.shade100,
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                          child: Icon(
                            Icons.lock_outline,
                            size: 120,
                            color: AppColors.primary,
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent.shade100,
                              border: BoxBorder.all(
                                color: AppColors.primary,
                                width: 8,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "?",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    AuraHeading(text: "Forgot Password?"),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: AuraSubtitle(
                        subtitle:
                            "Don't worry! It happens. Please enter \nyour registered phone number or email address.",
                        alignment: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    // phone or email
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              setState(() {
                                isPhone = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: isPhone
                                    ? Colors.transparent
                                    : AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(12),
                                border: isPhone
                                    ? Border.all(
                                        color: AppColors.primary,
                                        width: 1.5,
                                      )
                                    : null,
                              ),
                              child: const Center(child: Text("Phone")),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              setState(() {
                                isPhone = false;
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: !isPhone
                                    ? Colors.transparent
                                    : AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(12),
                                border: !isPhone
                                    ? Border.all(
                                        color: AppColors.primary,
                                        width: 1.5,
                                      )
                                    : null,
                              ),
                              child: const Center(child: Text("Email")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // input
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isPhone ? "Phone Number" : "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        AuraTextField(
                          controller: inputController,
                          prefixIcon: Icon(Icons.phone),
                          hint: isPhone
                              ? "Enter your phone number"
                              : "Enter your email address",
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    AuraButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(
                            address: inputController.text,
                          ),
                        ),
                      ),
                      text: "Send OTP",
                    ),
                    SizedBox(height: 30),
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuraSubtitle(subtitle: "Remember your password?"),
                        AuraLinkedText(
                          text: "Login",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
