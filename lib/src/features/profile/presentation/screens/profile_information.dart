import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paailaa/src/core/constants/colors.dart';
import 'package:paailaa/src/features/authentication/presentation/widgets/custom_buttom.dart';
import 'package:paailaa/src/features/profile/presentation/screens/upload_image.dart';
import 'package:paailaa/src/widgets/success_dialog.dart';

class ProfileInformation extends StatefulWidget {
  @override
  _ProfileInformationState createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(
    text: 'Sagar Bastola',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'sagatbastola@gmail.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '9800000000',
  );
  final TextEditingController _addressController = TextEditingController(
    text: 'Pokhara Nepal',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back icon
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Go back
              },
              child: SvgPicture.asset(
                'assets/icons/back.svg', // Replace with your SVG path
                height: 39,
                width: 39,
                color: primaryColor,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Profile Information',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 76,
                      backgroundColor: primaryColor,
                      child: Text(
                        'SB',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadImageScreen(),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildProfileField('Name:', _nameController, Icons.person),
                    SizedBox(height: 16),
                    _buildProfileField('Email:', _emailController, Icons.email),
                    SizedBox(height: 16),
                    _buildProfileField('Phone:', _phoneController, Icons.phone),
                    SizedBox(height: 16),
                    _buildProfileField(
                      'Address:',
                      _addressController,
                      Icons.location_on,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                text: 'Update Profile',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SuccessDialog(
                      message: 'Successfully! updated your Profile',
                      onContinue: () => Navigator.pop(context),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    final textStyle = TextStyle(
      fontFamily: 'RobotoFlex',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 1.25,
      letterSpacing: -0.02,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: textStyle.copyWith(color: Colors.grey[700]),
          ),
        ),
        SizedBox(
          width: 313,
          height: 46,
          child: TextFormField(
            controller: controller,
            style: textStyle,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.black),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
