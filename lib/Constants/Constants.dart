import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../uitls/EnvironmentConfig.dart';

class Constants{
  // Use environment-based configuration for API URL
  static String get api => EnvironmentConfig.getSecureApiUrl();

  static const double markerSize = 25;




///paths
  static const eventPath = "/event";
  static const participationPath = "/participation";
  static const userPath = "/user";

  static String getEventByIdPath() {
    return "$eventPath/getEventByIdForSignupPortal";
  }


  static String getUnregisteredTeamMembersPath() {
    return "$participationPath/getTeamMembersForRegistrationPortal";
  }

  static String getSignUpForEventPath() {
    return "$participationPath/signUpUserToEvent";
  }


  static String getDeleteUserPath() {
    return "$userPath/deleteUserInPortal";
  }

///colors
  static const Color secondaryColor = Color.fromRGBO(20, 32, 49, 1.0);

  static const Color primaryColor = Color.fromRGBO(15, 103, 254, 1.0);

  static const Color textColor = Color.fromRGBO(36, 46, 73, 1.0);

  static const Color shimmerGradient1 = Color.fromRGBO(15, 103, 254, 0.13);
  static const Color shimmerGradient2 = Color.fromRGBO(15, 103, 254, 0.19);

  static const Color errorColor = Colors.red;

  static String? font =  GoogleFonts.nunitoSans().fontFamily;

static ThemeData lightmode = ThemeData(
  useMaterial3: true,
  fontFamily: font,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  primaryColor: primaryColor,
  textTheme: TextTheme(
      titleMedium: const TextStyle(
          color: textColor,
          fontSize: 16),
      labelLarge: titleMediumTextStyle.copyWith(fontSize: 20),
      headlineMedium: titleMediumTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: secondaryColor)
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: secondaryColor),
    hintStyle: const TextStyle(color: secondaryColor, fontSize: 17),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor),
      borderRadius: BorderRadius.circular(25),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Constants.secondaryColor),
      borderRadius: BorderRadius.circular(25),
    ),
    iconColor: secondaryColor,
    suffixIconColor: secondaryColor,
    prefixIconColor: secondaryColor,
    labelStyle: Constants.grayTextStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: secondaryColor, width: 0),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryColor, // Define the cursor color here
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: primaryColor, // Set the color for all progress indicators, including circular loaders
  ),
);


// static ThemeData darkmode = ThemeData(
  //     colorScheme: ColorScheme.fromSwatch(
  //     primarySwatch: Colors.orange
  // ),
  //     textTheme: TextTheme()
  // );

  ElevatedButtonThemeData secondaryButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    disabledBackgroundColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  );

  static ButtonStyle primaryButtonStyle2 = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static TextStyle titleMediumTextStyle = TextStyle(
    color: secondaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    // fontFamily: Constants.globalFont
  );

  static TextStyle errorSmallTextStyle = TextStyle(
    color: errorColor,
    fontSize: 14,
    // fontFamily: Constants.globalFont
  );

static const TextStyle bodyTextStyle = TextStyle(
  fontSize: 16.0,           // Set font size
  color: Colors.black,      // Text color (black for general body text)
  fontWeight: FontWeight.w400, // Regular weight
  fontFamily: 'Roboto',      // Font family (can be adjusted)
);

// Error text style for displaying error messages
static const TextStyle errorTextStyle = TextStyle(
  fontSize: 16.0,           // Font size for error messages
  color: Colors.red,        // Red color for errors
  fontWeight: FontWeight.bold, // Bold weight for emphasis
  fontFamily: 'Roboto',      // Font family (can be adjusted)
);

  static TextStyle primaryButtonTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    // fontFamily: Constants.globalFont
  );

  static TextStyle whiteElevatedButtonTextStyle = TextStyle(
    color: primaryColor,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    // fontFamily: Constants.globalFont
  );

  static TextStyle cardTitleTextStyle = TextStyle(
    color: secondaryColor,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    // fontFamily: Constants.globalFont
  );

  static TextStyle grayTextStyle = TextStyle(
    color: secondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    // fontFamily: Constants.globalFont
  );

  static TextStyle cardGrayTextStyle = TextStyle(
    color: secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    // fontFamily: Constants.globalFont
  );

  static ElevatedButtonThemeData whiteElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: primaryColor, width: 2)),
    ),
  );

  static ElevatedButtonThemeData whiteElevatedButtonTheme2 =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: primaryColor, width: 2)),
    ),
  );

  static ElevatedButtonThemeData orange1ElevatedButtonTheme =
  ElevatedButtonThemeData(
      style: primaryButtonStyle
  );

  static ElevatedButtonThemeData orange2ElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );

}