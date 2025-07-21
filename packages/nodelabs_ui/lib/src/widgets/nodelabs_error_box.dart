import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is error box that displays errors inside.
class NodelabsErrorBox extends StatelessWidget {
  /// This is error box that displays errors inside.
  const NodelabsErrorBox({
    required this.errors,
    super.key,
  });

  /// Errors are listed in list.
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.2,
              ),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: List.generate(errors.length, (index) {
          final isLast = index == errors.length - 1;
          return Container(
            margin: !isLast ? const EdgeInsets.only(bottom: 4) : null,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: color,
                  size: 8,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  errors[index],
                  style: TextStyle(
                    color: color,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
