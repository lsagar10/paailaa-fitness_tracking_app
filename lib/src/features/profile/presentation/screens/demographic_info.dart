import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_textformfield.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/responsive_text_widget.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class DemographicInfo extends StatefulWidget {
  const DemographicInfo({super.key});

  @override
  State<DemographicInfo> createState() => _DemographicInfoState();
}

class _DemographicInfoState extends State<DemographicInfo> {
  final TextEditingController _ageController = TextEditingController();
  String? _selectedGender = 'Male'; // Default value
  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  String? _selectedEthnicity;
  final List<String> _ethnicityOptions = [
    'Asian',
    'Black',
    'Hispanic',
    'White',
    'Mixed',
    'Other',
  ];

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
                  border: Border.all(color: const Color(0xFF2D70C7)),
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
            const Text(
              'Demographics Information',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D70C7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildAgeField(),
            const SizedBox(height: 20),
            _buildGenderField(),
            const SizedBox(height: 20),
            _buildEthnicityField(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Update',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    message: 'Successfully! updated your information',
                    onContinue: () => Navigator.pop(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          text: 'Age',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: -0.32,
          ),
        ),
        const SizedBox(height: 6),
        CustomTextFormField(
          controller: _ageController,
          keyboardType: TextInputType.emailAddress,
          hintText: ' 20 years',
          textInputAction: TextInputAction.next,
          validator: null,
          cursorColor: textFormFieldBorderColor,
        ),
      ],
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: -0.32,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              items: _genderOptions.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(
                    gender,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Roboto Flex',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEthnicityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ethnicity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto Flex',
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: -0.32,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedEthnicity,
              isExpanded: true,
              hint: Text(
                'Select Ethnicity',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w400,
                ),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Roboto Flex',
                fontWeight: FontWeight.w400,
              ),
              items: _ethnicityOptions.map((String ethnicity) {
                return DropdownMenuItem<String>(
                  value: ethnicity,
                  child: Text(ethnicity),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEthnicity = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
