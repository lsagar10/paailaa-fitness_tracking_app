import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paailaa/src/features/authentication/data/repositories/auth_repositories.dart';
import 'package:paailaa/src/features/authentication/presentation/blocs/register/auth_bloc.dart';
import 'package:paailaa/src/features/authentication/presentation/screens/signup_screen.dart';   
import 'package:paailaa/src/features/authentication/presentation/screens/splash_screen.dart';   
import 'package:paailaa/src/features/home/presentation/blocs/step_counter_blocs/step_bloc.dart';
import 'package:paailaa/src/features/home/presentation/screens/food_description.dart';
import 'package:paailaa/src/features/home/presentation/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryBlue = Color(0xFF4477B8);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StepBloc()..add(RequestPermissionEvent()),
            ),
            BlocProvider(
              create: (context) => AuthBloc(authRepository: AuthRepository()),
            ),
          ],
          child: MaterialApp(
            title: 'Paailaa',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: primaryBlue, // ✅ Status bar color here
                  statusBarIconBrightness: Brightness.light, // White icons
                  statusBarBrightness: Brightness.dark, // For iOS
                ),
              ),
            ),
            builder: (context, child) {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                behavior: HitTestBehavior.translucent,
                child: child!,
              );
            },
            initialRoute: '/',
            routes: {'/': (context) => HomeScreen()},
            onGenerateRoute: (settings) {
              if (settings.name == '/foodDescription') {
                final args = settings.arguments as Map<String, dynamic>;
                return MaterialPageRoute(
                  builder: (context) => FoodDescriptionPage(foodData: args),
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
