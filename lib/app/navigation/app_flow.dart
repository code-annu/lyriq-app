import 'package:flutter/material.dart';
import 'package:lyriq/app/navigation/route.dart';
import 'package:lyriq/core/widget/route_builder/slide_in_route_builder.dart';
import 'package:lyriq/feature/authentication/presentation/ui/navigation/authentication_flow.dart';
import 'package:lyriq/feature/create_profile/ui/navigation/create_profile_flow.dart';

final appFlow = {
  AppRoutes.routeAuthentication: (BuildContext context) => AuthenticationFlow(
    onAuthSuccess: () {
      Navigator.pushReplacementNamed(context, AppRoutes.routeCreateProfile);
    },
  ),

  AppRoutes.routeCreateProfile: (BuildContext context) => CreateProfileFlow(),
};

class AppRouteGenerator {
  static Route onGenerateAppRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.routeAuthentication:
        return MaterialPageRoute(
          builder: (context) => AuthenticationFlow(
            onAuthSuccess: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.routeCreateProfile,
              );
            },
          ),
        );
      case AppRoutes.routeCreateProfile:
        return _generateSlideInHorizontalRoute(CreateProfileFlow());
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }

  static Route _generateSlideInHorizontalRoute(
    Widget page, {
    bool isLeftToRight = true,
  }) {
    return SlideInHorizontalPageRoute(
      page: page,
      startOffset: isLeftToRight ? Offset(1.0, 0.0) : Offset(-1.0, 0.0),
    );
  }
}
