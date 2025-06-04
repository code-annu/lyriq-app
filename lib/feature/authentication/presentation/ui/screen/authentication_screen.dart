import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyriq/core/res/images.dart';
import 'package:lyriq/core/widget/button/button_state.dart';
import 'package:lyriq/feature/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:lyriq/feature/authentication/presentation/ui/widget/continue_with_google_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key, required this.onAuthSuccess});

  final VoidCallback onAuthSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => current is AuthenticationActionState,
      listener: (context, state) {
        if (state is GoogleAuthSuccessState) {
          onAuthSuccess();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopSection(context),
          _buildContinueWithGoogleButton(context),
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(APP_LOGO, width: 100, height: 100),
        Text("Lyriq"),
        const SizedBox(height: 40.0),
        _buildWelcomeText(context),
      ],
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        'Experience Music In Real-Time With Others.',
        textAlign: TextAlign.center,
        style: theme.textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
          letterSpacing: 1.5,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildContinueWithGoogleButton(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (current, previous) => current is! AuthenticationActionState,
      builder: (context, state) {
        final buttonState = state is GoogleAuthenticatingState
            ? ButtonState.LOADING
            : ButtonState.ENABLED;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 60.0,
            child: ContinueWithGoogleButton(
              text: 'Continue with Google',
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                  ContinueWithGoogleButtonClickEvent(),
                );
              },
              state: buttonState,
            ),
          ),
        );
      },
    );
  }
}
