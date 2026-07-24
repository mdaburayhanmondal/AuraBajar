import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_heading.dart';
import 'package:aurabajar/aura_widgets/aura_linked_text.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_text_field.dart';
import 'package:aurabajar/screens/login_screen.dart';
import 'package:flutter/material.dart';

class PasswordChangingScreen extends StatefulWidget {
  const PasswordChangingScreen({super.key});

  @override
  State<PasswordChangingScreen> createState() => _PasswordChangingScreenState();
}

class _PasswordChangingScreenState extends State<PasswordChangingScreen> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  List conditions = <String>[
    "8 characters",
    "One uppercase letter",
    "One number",
    "One special character",
  ];

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
                    // icon
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[100],
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                          child: Icon(
                            Icons.lock_outline,
                            size: 120,
                            color: Colors.green,
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green,

                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    AuraHeading(text: "Set New Password"),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: AuraSubtitle(
                        subtitle: "Create a new password for your account",
                        alignment: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      spacing: 20,
                      children: [
                        // new password
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
                              controller: newPassController,
                              prefixIcon: Icon(Icons.lock),
                              hint: "Enter new password",
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
                              controller: confirmPassController,
                              prefixIcon: Icon(Icons.lock),
                              hint: "Enter your password again",
                              isPassword: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ListView.builder(
                          itemCount: conditions.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  Text(
                                    conditions[index],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    AuraButton(onPressed: () {}, text: "Reset Password"),
                    SizedBox(height: 30),
                    AuraLinkedText(
                      text: "Back to Login",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
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
