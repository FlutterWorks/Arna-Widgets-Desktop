import 'package:arna/arna.dart';

/// The color and geometry [ArnaTextTheme]s for Arna apps.
///
/// The color text themes are [light] and [dark].
class ArnaTypography {
  /// This class is not meant to be instantiated or extended; this constructor prevents instantiation and extension.
  ArnaTypography._();

  /// A text theme used for [Brightness.light] themes.
  static const ArnaTextTheme light = ArnaTextTheme(
    displayTextStyle: TextStyle(
      debugLabel: 'displayTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      fontSize: 30,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineTextStyle: TextStyle(
      debugLabel: 'headlineTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleTextStyle: TextStyle(
      debugLabel: 'titleTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyTextStyle: TextStyle(
      debugLabel: 'bodyTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    subtitleTextStyle: TextStyle(
      debugLabel: 'subtitleTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: ArnaColors.secondaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    buttonTextStyle: TextStyle(
      debugLabel: 'buttonTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    captionTextStyle: TextStyle(
      debugLabel: 'captionTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: ArnaColors.primaryTextColor,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );

  /// A text theme used for [Brightness.dark] themes.
  static const ArnaTextTheme dark = ArnaTextTheme(
    displayTextStyle: TextStyle(
      debugLabel: 'displayTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      fontSize: 30,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    headlineTextStyle: TextStyle(
      debugLabel: 'headlineTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    titleTextStyle: TextStyle(
      debugLabel: 'titleTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    bodyTextStyle: TextStyle(
      debugLabel: 'bodyTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    subtitleTextStyle: TextStyle(
      debugLabel: 'subtitleTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: ArnaColors.secondaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    buttonTextStyle: TextStyle(
      debugLabel: 'buttonTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    captionTextStyle: TextStyle(
      debugLabel: 'captionTextStyle',
      inherit: false,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: ArnaColors.primaryTextColorDark,
      decoration: TextDecoration.none,
      overflow: TextOverflow.fade,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    ),
  );
}