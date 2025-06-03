import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffb4005b),
      surfaceTint: Color(0xffba005f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe10274),
      onPrimaryContainer: Color(0xfffffaf9),
      secondary: Color(0xffa7315f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffb73a1),
      onSecondaryContainer: Color(0xff720037),
      tertiary: Color(0xffab2c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd63900),
      onTertiaryContainer: Color(0xfffff9f8),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff27171b),
      onSurfaceVariant: Color(0xff5b3f46),
      outline: Color(0xff8f6f76),
      outlineVariant: Color(0xffe3bdc5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3e2b30),
      inversePrimary: Color(0xffffb1c6),
      primaryFixed: Color(0xffffd9e1),
      onPrimaryFixed: Color(0xff3f001c),
      primaryFixedDim: Color(0xffffb1c6),
      onPrimaryFixedVariant: Color(0xff8e0047),
      secondaryFixed: Color(0xffffd9e1),
      onSecondaryFixed: Color(0xff3f001c),
      secondaryFixedDim: Color(0xffffb1c6),
      onSecondaryFixedVariant: Color(0xff881647),
      tertiaryFixed: Color(0xffffdbd1),
      onTertiaryFixed: Color(0xff3b0900),
      tertiaryFixedDim: Color(0xffffb5a0),
      onTertiaryFixedVariant: Color(0xff872100),
      surfaceDim: Color(0xfff0d3d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f2),
      surfaceContainer: Color(0xffffe8ec),
      surfaceContainerHigh: Color(0xffffe1e7),
      surfaceContainerHighest: Color(0xfff9dbe1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lyriqScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe00f32),
      onPrimary: Color(0xffffffff),
      secondary: Color(0xff625f6a),
      secondaryContainer: Color(0xff3c3a40),
      onSecondary: Color(0xff787582),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      surface: Color(0x55201f22),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff6f8fa),
    );
  }


  ThemeData lyriq() {
    return theme(lyriqScheme());
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
