import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';

class CompleteInformation extends StatefulWidget {
  const CompleteInformation({super.key});

  @override
  State<CompleteInformation> createState() => _CompleteInformationState();
}

class _CompleteInformationState extends State<CompleteInformation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _sugarLevelController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bodyTypeController = TextEditingController();
  final TextEditingController _bodyGoalController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bloodPressureController.dispose();
    _sugarLevelController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    _bodyTypeController.dispose();
    _bodyGoalController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF2D70C7),
                ),
              ),
            ),
            const SizedBox(width: 40),
            Text(
              'Complete Information',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Introductory text section
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You are all set.!!',
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 13),
                  ResponsiveText(text: "Thank you for subscribing!"),
                  const SizedBox(height: 20),
                  ResponsiveText(
                    text:
                        "You're just a few steps away from your personalized fitness journey.",
                  ),
                  const SizedBox(height: 20),
                  ResponsiveText(
                    text:
                        "To unlock your custom workout and meal plans, please complete your health profile.",
                  ),
                  const SizedBox(height: 5),
                  ResponsiveText(
                    text:
                        "This helps us tailor everything to your unique goals and lifestyle.",
                  ),
                ],
              ),
            ),

            // TabBar moved here
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 17),
              child: TabBar(
                controller: _tabController,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: primaryColor,
                tabs: const [
                  Tab(text: 'Health Metrics'),
                  Tab(text: 'Body Details'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tab content with fixed height
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Health Metrics
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: _buildFirstFormSection(),
                  ),
                  // Body Details
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: _buildSecondFormSection(),
                  ),
                ],
              ),
            ),

            // Button
            Padding(
              padding: const EdgeInsets.all(17),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (_tabController.index == 0) {
                      _tabController.animateTo(1);
                    } else {
                      // Handle completion logic here
                    }
                  },
                  child: Text(
                    _tabController.index == 0 ? "Next" : "Complete",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: "Blood Pressure",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _bloodPressureController,
          hintText: "Enter your Blood Pressure",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your blood pressure';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ResponsiveText(
          text: "Sugar Level",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _sugarLevelController,
          hintText: "Enter your sugar level",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your sugar level';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ResponsiveText(
          text: "Body Weight (in kgs)",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _weightController,
          hintText: "Enter your weight",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your weight';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ResponsiveText(
          text: "Age (in Years)",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _ageController,
          hintText: "Enter your Age",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your age';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSecondFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: "Body Type",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _bodyTypeController,
          hintText: "Enter your Body Type",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your body type';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ResponsiveText(
          text: "Body Goal",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _bodyGoalController,
          hintText: "Enter your body goal",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your body goal';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ResponsiveText(
          text: "Select Gender",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: _genderController,
          hintText: "Select your gender",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select your gender';
            }
            return null;
          },
        ),
      ],
    );
  }
}
