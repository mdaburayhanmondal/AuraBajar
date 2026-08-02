import 'package:aurabajar/aura_widgets/aura_button.dart';
import 'package:aurabajar/aura_widgets/aura_subtitle.dart';
import 'package:aurabajar/aura_widgets/aura_title.dart';
import 'package:aurabajar/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "Md. Abu Rayhan Mondal";
    phoneController.text = "+880 1317 546595";
    emailController.text = "mdaburayhanmondal@gmail.com";
    addressController.text = "Nakhalpara";
    dobController.text = "20 May 2003";
    cityController.text = "Dhaka";
    postalCodeController.text = "1215";
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dobController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  String selectedCountry = "Bangladesh";

  final countries = [
    "Bangladesh",
    "India",
    "Pakistan",
    "Nepal",
    "Bhutan",
    "Sri Lanka",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AuraTitle(title: "Edit Profile"),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 20),
                // sec1
                Row(
                  spacing: 16,
                  children: [
                    Stack(
                      alignment: AlignmentGeometry.bottomRight,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://www.rayhansenpai.dev/_next/image?url=%2Frayhan-senpai-2.jpg&w=750&q=75",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuraTitle(title: "Md. Abu Rayhan Mondal"),
                        AuraSubtitle(subtitle: "+880 1317 546595"),
                        AuraSubtitle(subtitle: "mdaburayhanmondal@gmail.com"),
                      ],
                    ),
                  ],
                ),
                // personal details
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: AuraTitle(title: "Personal Details"),
                      ),
                      buildInputColumn("Full Name", nameController),
                      buildInputColumn("Phone Number", phoneController),
                      buildInputColumn("Email Address", emailController),
                      Column(
                        children: [
                          Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: AuraSubtitle(subtitle: "Date of Birth"),
                          ),
                          TextFormField(
                            controller: dobController,
                            readOnly: true,
                            onTap: _pickDate,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey.withAlpha(40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // address
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: AuraTitle(title: "Address"),
                      ),
                      buildInputColumn("Full Address", addressController),
                      // city and zip
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            flex: 5,
                            child: buildInputColumn("City", cityController),
                          ),
                          Expanded(
                            flex: 3,
                            child: buildInputColumn(
                              "Postal Code",
                              postalCodeController,
                            ),
                          ),
                        ],
                      ),
                      // country
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuraSubtitle(subtitle: "Country"),
                          const SizedBox(height: 4),
                          DropdownButtonFormField<String>(
                            initialValue: selectedCountry,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey.withAlpha(40),
                                ),
                              ),
                            ),
                            items: countries.map((country) {
                              return DropdownMenuItem(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // account info
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: AppColors.grey.withAlpha(40)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: AuraTitle(title: "Account Information"),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: AppColors.grey.withAlpha(40),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AuraButton(onPressed: () {}, text: "Save Changes"),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildInputColumn(String label, TextEditingController controller) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuraSubtitle(subtitle: label),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey.withAlpha(40)),
            ),
          ),
        ),
      ],
    );
  }
}
