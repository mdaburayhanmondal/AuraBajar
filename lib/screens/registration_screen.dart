import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_heading.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_text_field.dart';
import 'package:aurabajar/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isAgreed = false;

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
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                // main column
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // greeting
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuraHeading(text: "Create Account"),
                        AuraSubtitle(
                          subtitle: "Sign up to get started",
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    // input fields
                    Column(
                      spacing: 12,
                      children: [
                        // full name
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            AuraTextField(
                              controller: fullNameController,
                              prefixIcon: Icon(Icons.person),
                              hint: "Enter your full name",
                            ),
                          ],
                        ),
                        // phone number
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            AuraTextField(
                              controller: phoneController,
                              prefixIcon: Icon(Icons.phone),
                              hint: "Enter your phone number",
                            ),
                          ],
                        ),
                        // email
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            AuraTextField(
                              controller: emailController,
                              prefixIcon: Icon(Icons.email),
                              hint: "Enter your email address",
                            ),
                          ],
                        ),
                        // password
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            AuraTextField(
                              controller: passwordController,
                              prefixIcon: Icon(Icons.lock),
                              hint: "Enter your password",
                              isPassword: true,
                            ),
                          ],
                        ),
                        // confirm password
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            AuraTextField(
                              controller: passwordController,
                              prefixIcon: Icon(Icons.lock),
                              hint: "Enter your password again",
                              isPassword: true,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: isAgreed,
                              onChanged: (val) {
                                setState(() {
                                  isAgreed = val ?? false;
                                });
                              },
                            ),
                            AuraSubtitle(subtitle: "I agree to the"),
                            AuraLinkedText(text: "terms & conditions"),
                          ],
                        ),
                        AuraButton(onPressed: () {}, text: "Register"),
                      ],
                    ),
                    SizedBox(height: 20),
                    // login screen
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuraSubtitle(subtitle: "Already have an account?"),
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
