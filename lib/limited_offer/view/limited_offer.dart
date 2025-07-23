import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

part '_package.dart';
part '_perk.dart';

const _blur = 10.0;
const _bottomSheetBorderRadius = Radius.circular(
  32,
);
const _bottomSheetPadding = EdgeInsets.only(top: 24, left: 18, right: 18);
const _titleFontSize = 20.0;

/// Limited offer dialog.
class LimitedOffer extends StatelessWidget {
  /// Limited offer dialog.
  const LimitedOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
            child: const SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _BottomSheet(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: _bottomSheetPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: _bottomSheetBorderRadius,
          topRight: _bottomSheetBorderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.t.limitedOffer,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: _titleFontSize,
                ),
          ),
          Text(
            context.t.limitedOfferDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          const _Perks(),
          const SizedBox(
            height: 16,
          ),
          Text(
            context.t.pickPackageToUnlock,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          const _PackageList(),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: NodelabsPrimaryButton(
              onTap: () {},
              title: context.t.seeAllTokens,
            ),
          ),
        ],
      ),
    );
  }
}
