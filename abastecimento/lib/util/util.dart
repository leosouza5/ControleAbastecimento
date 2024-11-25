import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

final Color fundoPrincipal = Color(0xFF121212);
final Color fundoSecundaria = Color(0xFF1E1E1E);
final Color bordas = Color(0xFF2C2C2C);
final Color textoPrincipal = Color(0xFFE0E0E0);
final Color textoSecundario = Color(0xFFE0E0E0);
final Color botoesNormal = Color(0xFF424242);
final Color botoesDestaque = Color(0xFF616161);
final Color corErro = Color(0xFFD32F2F);
