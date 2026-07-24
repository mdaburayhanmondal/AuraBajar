import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_heading.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_text_field.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/screens/forgot_password_screen.dart';
import 'package:aurabajar/screens/registration_screen.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                        AuraHeading(text: "Welcome Back!👋"),
                        AuraSubtitle(
                          subtitle: "Log in to continue shopping",
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    // input fields
                    Column(
                      spacing: 24,
                      children: [
                        // phone number
                        Column(
                          spacing: 6,
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
                        // password
                        Column(
                          spacing: 6,
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
                        SizedBox(
                          width: double.infinity,
                          child: AuraLinkedText(
                            text: "Forgot password?",
                            alignment: TextAlign.end,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            ),
                          ),
                        ),
                        AuraButton(onPressed: () {}, text: "Login"),
                      ],
                    ),
                    SizedBox(height: 30),
                    // other login options
                    Column(
                      spacing: 20,
                      children: [
                        AuraSubtitle(subtitle: "or login with"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            // google login
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 24,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: BoxBorder.all(color: AppColors.grey),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/960px-Google_Favicon_2025.svg.png",
                                      ),
                                    ),
                                    AuraTitle(title: "Google"),
                                  ],
                                ),
                              ),
                            ),
                            //   facebook login
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 24,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: BoxBorder.all(color: AppColors.grey),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png",
                                      ),
                                    ),
                                    AuraTitle(title: "Facebook"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // registration screen
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuraSubtitle(subtitle: "Don't have an account?"),
                        AuraLinkedText(
                          text: "Register",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
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
