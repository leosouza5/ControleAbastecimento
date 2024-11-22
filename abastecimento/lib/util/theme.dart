import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff28638a),
      surfaceTint: Color(0xff28638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcae6ff),
      onPrimaryContainer: Color(0xff001e30),
      secondary: Color(0xff04677e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb5ebff),
      onSecondaryContainer: Color(0xff001f28),
      tertiary: Color(0xff2b638b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcce5ff),
      onTertiaryContainer: Color(0xff001e31),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff41474d),
      outline: Color(0xff72787e),
      outlineVariant: Color(0xffc1c7ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff96cdf8),
      primaryFixed: Color(0xffcae6ff),
      onPrimaryFixed: Color(0xff001e30),
      primaryFixedDim: Color(0xff96cdf8),
      onPrimaryFixedVariant: Color(0xff004b70),
      secondaryFixed: Color(0xffb5ebff),
      onSecondaryFixed: Color(0xff001f28),
      secondaryFixedDim: Color(0xff87d1eb),
      onSecondaryFixedVariant: Color(0xff004e60),
      tertiaryFixed: Color(0xffcce5ff),
      onTertiaryFixed: Color(0xff001e31),
      tertiaryFixedDim: Color(0xff98ccf9),
      onTertiaryFixedVariant: Color(0xff054b71),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00476a),
      surfaceTint: Color(0xff28638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff427aa1),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00495b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2e7e95),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00476c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4479a2),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff181c20),
      onSurfaceVariant: Color(0xff3d4349),
      outline: Color(0xff5a6066),
      outlineVariant: Color(0xff757b82),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff96cdf8),
      primaryFixed: Color(0xff427aa1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff246187),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2e7e95),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00657b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4479a2),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff286088),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00253a),
      surfaceTint: Color(0xff28638a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00476a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002630),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff00495b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00253b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00476c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1f252a),
      outline: Color(0xff3d4349),
      outlineVariant: Color(0xff3d4349),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xffddeeff),
      primaryFixed: Color(0xff00476a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003049),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff00495b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00313e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00476c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00304b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff96cdf8),
      surfaceTint: Color(0xff96cdf8),
      onPrimary: Color(0xff00344f),
      primaryContainer: Color(0xff004b70),
      onPrimaryContainer: Color(0xffcae6ff),
      secondary: Color(0xff87d1eb),
      onSecondary: Color(0xff003543),
      secondaryContainer: Color(0xff004e60),
      onSecondaryContainer: Color(0xffb5ebff),
      tertiary: Color(0xff98ccf9),
      onTertiary: Color(0xff003351),
      tertiaryContainer: Color(0xff054b71),
      onTertiaryContainer: Color(0xffcce5ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101418),
      onSurface: Color(0xffe0e2e8),
      onSurfaceVariant: Color(0xffc1c7ce),
      outline: Color(0xff8b9198),
      outlineVariant: Color(0xff41474d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff28638a),
      primaryFixed: Color(0xffcae6ff),
      onPrimaryFixed: Color(0xff001e30),
      primaryFixedDim: Color(0xff96cdf8),
      onPrimaryFixedVariant: Color(0xff004b70),
      secondaryFixed: Color(0xffb5ebff),
      onSecondaryFixed: Color(0xff001f28),
      secondaryFixedDim: Color(0xff87d1eb),
      onSecondaryFixedVariant: Color(0xff004e60),
      tertiaryFixed: Color(0xffcce5ff),
      onTertiaryFixed: Color(0xff001e31),
      tertiaryFixedDim: Color(0xff98ccf9),
      onTertiaryFixedVariant: Color(0xff054b71),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff363a3e),
      surfaceContainerLowest: Color(0xff0b0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff272a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9ad1fc),
      surfaceTint: Color(0xff96cdf8),
      onPrimary: Color(0xff001828),
      primaryContainer: Color(0xff5f96bf),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff8bd5ef),
      onSecondary: Color(0xff001921),
      secondaryContainer: Color(0xff4f9ab3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9cd0fe),
      onTertiary: Color(0xff001829),
      tertiaryContainer: Color(0xff6296c0),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101418),
      onSurface: Color(0xfff9fbff),
      onSurfaceVariant: Color(0xffc6cbd2),
      outline: Color(0xff9ea3aa),
      outlineVariant: Color(0xff7e848a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff004d72),
      primaryFixed: Color(0xffcae6ff),
      onPrimaryFixed: Color(0xff001320),
      primaryFixedDim: Color(0xff96cdf8),
      onPrimaryFixedVariant: Color(0xff003a57),
      secondaryFixed: Color(0xffb5ebff),
      onSecondaryFixed: Color(0xff00141a),
      secondaryFixedDim: Color(0xff87d1eb),
      onSecondaryFixedVariant: Color(0xff003c4a),
      tertiaryFixed: Color(0xffcce5ff),
      onTertiaryFixed: Color(0xff001321),
      tertiaryFixedDim: Color(0xff98ccf9),
      onTertiaryFixedVariant: Color(0xff003959),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff363a3e),
      surfaceContainerLowest: Color(0xff0b0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff272a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9fbff),
      surfaceTint: Color(0xff96cdf8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9ad1fc),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff5fcff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff8bd5ef),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9cd0fe),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9fbff),
      outline: Color(0xffc6cbd2),
      outlineVariant: Color(0xffc6cbd2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inversePrimary: Color(0xff002d45),
      primaryFixed: Color(0xffd3eaff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9ad1fc),
      onPrimaryFixedVariant: Color(0xff001828),
      secondaryFixed: Color(0xffc2eeff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff8bd5ef),
      onSecondaryFixedVariant: Color(0xff001921),
      tertiaryFixed: Color(0xffd4e9ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9cd0fe),
      onTertiaryFixedVariant: Color(0xff001829),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff363a3e),
      surfaceContainerLowest: Color(0xff0b0f12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1c2024),
      surfaceContainerHigh: Color(0xff272a2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
