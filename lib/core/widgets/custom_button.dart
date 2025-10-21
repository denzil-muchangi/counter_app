import 'package:flutter/material.dart';

/// Custom button widget that can be reused and customized throughout the app
class CustomButton extends StatelessWidget {
  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Icon to display on the button
  final IconData icon;

  /// Text label for the button
  final String label;

  /// Background color of the button
  final Color? backgroundColor;

  /// Foreground color (text and icon color)
  final Color? foregroundColor;

  /// Whether the button is enabled or disabled
  final bool isEnabled;

  /// Type of button for semantic purposes
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.isEnabled = true,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine colors based on button type and state
    final effectiveBackgroundColor = backgroundColor ??
        (isEnabled
            ? _getDefaultBackgroundColor(colorScheme)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5));

    final effectiveForegroundColor = foregroundColor ??
        (isEnabled
            ? _getDefaultForegroundColor(colorScheme)
            : colorScheme.onSurfaceVariant.withValues(alpha: 0.7));

    return FilledButton.icon(
      onPressed: isEnabled ? onPressed : null,
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: isEnabled ? 2 : 0,
        shadowColor: effectiveBackgroundColor.withValues(alpha: 0.3),
      ),
    );
  }

  Color _getDefaultBackgroundColor(ColorScheme colorScheme) {
    switch (buttonType) {
      case ButtonType.decrement:
        return colorScheme.error;
      case ButtonType.reset:
        return colorScheme.secondary;
      case ButtonType.increment:
        return colorScheme.primary;
      case ButtonType.primary:
        return colorScheme.primary;
    }
  }

  Color _getDefaultForegroundColor(ColorScheme colorScheme) {
    switch (buttonType) {
      case ButtonType.decrement:
        return colorScheme.onError;
      case ButtonType.reset:
        return colorScheme.onSecondary;
      case ButtonType.increment:
        return colorScheme.onPrimary;
      case ButtonType.primary:
        return colorScheme.onPrimary;
    }
  }
}

/// Enum to define different types of buttons for semantic purposes
enum ButtonType {
  primary,
  increment,
  decrement,
  reset,
}