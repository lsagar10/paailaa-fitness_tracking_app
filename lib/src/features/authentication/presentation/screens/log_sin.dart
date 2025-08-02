// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:paailaa/src/features/authentication/presentation/screens/login_screen.dart';

// class LogSin extends StatelessWidget {
//   const LogSin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40.h),
//                 Center(
//                   child: Text(
//                     'Beauticaa',
//                     style: TextStyle(
//                       fontSize: 40.sp,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'ReinaNeueDisplay',
//                       color: Color.fromRGBO(86, 42, 91, 1),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'Welcome to Beauticaa',
//                   style: GoogleFonts.roboto(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(0, 0, 0, 1),
//                   ),
//                 ),
//                 SizedBox(height: 50.h),
//                 Image.asset(
//                   'assets/images/logsin.png',
//                   width: MediaQuery.of(context).size.width * 1,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(height: 40.h),
//                 Text(
//                   'Shop your favourite item',
//                   style: GoogleFonts.roboto(
//                     fontSize: 14.sp,
//                     color: Color.fromRGBO(0, 0, 0, 1),
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 ShaderMask(
//                   shaderCallback: (bounds) => LinearGradient(
//                     colors: [
//                       Color(0xFF512C83),
//                       Color(0xFF1D1B4A),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ).createShader(
//                       Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//                   child: Text(
//                     'Go! beauticaa',
//                     style: GoogleFonts.roboto(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30.h),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 48.h,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => LoginScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xFF512C83),
//                             Color(0xFF1D1B4A),
//                           ],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Login / Signup',
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.h), // Bottom space
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
