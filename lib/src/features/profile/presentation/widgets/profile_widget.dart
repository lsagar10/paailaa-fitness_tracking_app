import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paailaa/src/core/constants/colors.dart';

/// SECTION TITLE
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          height: 1.0,
          letterSpacing: -0.32.sp,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
    );
  }
}

/// PROFILE LIST TILE
class ProfileListTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget? destination;
  final VoidCallback? onTap;

  const ProfileListTile({
    Key? key,
    required this.iconPath,
    required this.title,
    this.destination,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.all(2),
      leading: SvgPicture.asset(
        iconPath,
        height: 24.h,
        width: 24.w,
        colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 16.sp,
          height: 1.0,
          letterSpacing: -0.32.sp,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: primaryColor),
      onTap: onTap ??
          () {
            if (destination != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => destination!),
              );
            }
          },
    );
  }
}
