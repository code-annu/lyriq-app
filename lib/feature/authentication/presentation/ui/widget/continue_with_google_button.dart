import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyriq/core/res/images.dart';
import 'package:lyriq/core/widget/button/button_state.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.onDisablePressed,
    this.state = ButtonState.ENABLED,
  });

  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onDisablePressed;
  final ButtonState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: () {
        if (state == ButtonState.ENABLED) {
          onPressed();
        } else if (state == ButtonState.DISABLED) {
          onDisablePressed?.call();
        }
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(color: theme.colorScheme.surface),
      ),
      child: state == ButtonState.LOADING
          ? _buildLoadingContent(context)
          : _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(GOOGLE_ICON, width: 25.0, height: 25.0),
        const SizedBox(width: 15.0),
        _buildButtonText(context),
      ],
    );
  }

  Widget _buildButtonText(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ],
    );
  }
}
