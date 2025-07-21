import 'package:flutter/material.dart';
import 'package:nodelabs_ui/gen/assets.gen.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

/// Text input field for Nodelabs Case Study project.
class NodelabsTextField extends StatefulWidget {
  /// Text input field for Nodelabs Case Study project.
  const NodelabsTextField({
    this.iconPath,
    this.label,
    this.isPassword = false,
    super.key,
  });

  /// Icon of the text field.
  final String? iconPath;

  /// Label of the text field.
  final Widget? label;

  /// If true hide icon will be displayed to obscure button.
  final bool isPassword;

  @override
  State<NodelabsTextField> createState() => _NodelabsTextFieldState();
}

class _NodelabsTextFieldState extends State<NodelabsTextField> {
  late final _isObscured = ValueNotifier<bool>(widget.isPassword);

  @override
  Widget build(BuildContext context) {
    final icon = widget.iconPath != null
        ? SvgIcon(
            iconPath: widget.iconPath!,
            color: Theme.of(context).colorScheme.onSurface,
          )
        : null;

    return ListenableBuilder(
      listenable: _isObscured,
      builder: (context, _) {
        return TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 24, right: 10),
              child: icon,
            ),
            label: widget.label,
            suffixIcon: _ObscureButton(
              isPassword: widget.isPassword,
              isObscured: _isObscured.value,
              onTap: () {
                _isObscured.value = !_isObscured.value;
              },
            ),
          ),
          obscureText: _isObscured.value,
        );
      },
    );
  }
}

class _ObscureButton extends StatelessWidget {
  const _ObscureButton({
    required this.isPassword,
    required this.isObscured,
    required this.onTap,
  });

  final bool isPassword;
  final bool isObscured;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (!isPassword) return const SizedBox();
    return IconButton(
      onPressed: onTap,
      icon: SvgIcon(
        iconPath: isObscured ? Assets.icons.eyeClosed : Assets.icons.eye,
        package: 'nodelabs_ui',
        color: Theme.of(context).inputDecorationTheme.labelStyle?.color,
      ),
    );
  }
}
