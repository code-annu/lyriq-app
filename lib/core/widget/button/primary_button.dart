import 'package:flutter/material.dart';
import 'package:lyriq/core/widget/button/button_state.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.state = ButtonState.ENABLED,
    this.onDisablePressed,
  });

  final String text;
  final VoidCallback onPressed;
  final ButtonState state;
  final VoidCallback? onDisablePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () {
        if (state == ButtonState.ENABLED) {
          onPressed();
        } else if (state == ButtonState.DISABLED) {
          onDisablePressed?.call();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: state==ButtonState.LOADING?_buildLoadingContent(context):_buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    final theme = Theme.of(context);
    return CircularProgressIndicator(
      color:theme.colorScheme.onPrimary,
    );
  }
}
