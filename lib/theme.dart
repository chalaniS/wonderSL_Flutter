import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      labelLarge: lableTextStyle,
      labelMedium: lableTextStyle,
      labelSmall: lableTextStyle,
      bodyMedium: TextStyle(color: secondaryColor40LightTheme),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: TextStyle(color: textColorLightTheme),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
      fillColor: secondaryColor5LightTheme,
      filled: true,
      border: lightThemeOutlineInputBorder,
      enabledBorder: lightThemeOutlineInputBorder,
      focusedBorder: lightThemeOutlineInputBorder,
      disabledBorder: lightThemeOutlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        shape: const StadiumBorder(),
        backgroundColor: primaryColor,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: textColorLightTheme),
    dividerColor: secondaryColor5LightTheme,
  );
}

const OutlineInputBorder lightThemeOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);

const lableTextStyle = TextStyle(color: secondaryColor20LightTheme);
