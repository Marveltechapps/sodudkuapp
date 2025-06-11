import 'package:flutter/material.dart';
import 'package:sodakku/presentation/category/categories_screen.dart';
import 'package:sodakku/presentation/coupon/screens/applying_coupon_screen.dart';
import 'package:sodakku/presentation/entry/login/login_screen.dart';
import 'package:sodakku/presentation/entry/splash/splash_screen.dart';
import 'package:sodakku/presentation/home/home_screen.dart';
import 'package:sodakku/presentation/payment/payment_screen.dart';
import 'package:sodakku/presentation/settings/address/address_screen.dart';
import 'package:sodakku/presentation/settings/customer_support/customer_support_screen.dart';
import 'package:sodakku/presentation/settings/general_info/general_policies_screen.dart';
import 'package:sodakku/presentation/settings/general_info/privacy_policy_screen.dart';
import 'package:sodakku/presentation/settings/general_info/terms_conditions_screen.dart';
import 'package:sodakku/presentation/settings/notifications/notifications_screen.dart';
import 'package:sodakku/presentation/settings/order/order_screen.dart';
import 'package:sodakku/presentation/settings/payment_management/payment_management_screen.dart';
import 'package:sodakku/presentation/settings/profile/profile_screen.dart';
import 'package:sodakku/presentation/settings/refunds/refunds_screen.dart';
import 'package:sodakku/presentation/settings/settings_screen.dart';
import 'package:sodakku/utils/constant.dart';
import 'presentation/entry/otp/otp_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodakku',
      debugShowCheckedModeBanner: false,

      // ✅ Locks text and display scale
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 71, 3, 1),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          elevation: 4,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColor,
          selectionColor: appColor,
          selectionHandleColor: appColor,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          bodySmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontFamily: "Poppins Bold",
            fontSize: 30,
            color: Colors.black,
            height: 1,
            letterSpacing: 0.5,
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpScreen(),
        '/home': (context) => HomeScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/payment': (context) => PaymentScreen(),
        '/ApplyingCouponScreen': (context) => ApplyingCouponScreen(),
        '/settings': (context) => SettingsScreen(),
        '/order': (context) => OrderScreen(),
        '/customerSupport': (context) => CustomerSupportScreen(),
        '/address': (context) => AddressScreen(),
        '/refunds': (context) => RefundsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/generalPolicies': (context) => GeneralPoliciesScreen(),
        '/termsAndConditions': (context) => TermsConditionsScreen(),
        '/privacyPolicy': (context) => PrivacyPolicyScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/paymentManagementScreen': (context) => PaymentManagementScreen(),
      },

      home: SplashScreen(),
    );
  }
}
