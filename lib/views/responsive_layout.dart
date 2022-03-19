import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < kTabletBreakpoint;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= kTabletBreakpoint &&
      MediaQuery.of(context).size.width < kDesktopBreakPoint;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= kDesktopBreakPoint;
  static bool isNotMobile(BuildContext context) =>
      MediaQuery.of(context).size.width > kTabletBreakpoint;

  String stringSwitchScreenType(BuildContext context) {
    int screenWidth = MediaQuery.of(context).size.width.toInt();
    if (screenWidth < kTabletBreakpoint) {
      return 'mobile';
    } else if (screenWidth >= kTabletBreakpoint &&
        screenWidth < kDesktopBreakPoint) {
      return 'tablet';
    } else {
      return 'desktop';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth < kTabletBreakpoint) {
          return mobileBody;
        } else if (dimens.maxWidth >= kTabletBreakpoint &&
            dimens.maxWidth < kDesktopBreakPoint) {
          return tabletBody ?? mobileBody;
        } else {
          return desktopBody ?? mobileBody;
        }
      },
    );
  }
}

const kTabletBreakpoint = 768.0;
const kDesktopBreakPoint = 1440.0;

const kSideMenuWidth = 300.0;
const kNavigationRailWidth = 72.0;

//const kMaxWidth = 1180.0;
const kMaxWidth = 1600.0;
