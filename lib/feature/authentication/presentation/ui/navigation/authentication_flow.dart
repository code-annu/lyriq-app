import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyriq/feature/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:lyriq/feature/authentication/presentation/ui/screen/authentication_screen.dart';

class AuthenticationFlow extends StatelessWidget {
  const AuthenticationFlow({super.key, required this.onAuthSuccess});

  final VoidCallback onAuthSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: AuthenticationScreen(onAuthSuccess: onAuthSuccess),
    );
  }
}
