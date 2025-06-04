import 'package:flutter/material.dart';
import 'package:lyriq/app/navigation/route.dart';
import 'package:lyriq/feature/authentication/presentation/ui/navigation/authentication_flow.dart';

final appFlow = {
  AppRoutes.routeAuthentication: (BuildContext context) =>
      AuthenticationFlow(onAuthSuccess: () {}),
};
