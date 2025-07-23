import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

const _blur = 10.0;
const _bottomSheetBorderRadius = Radius.circular(
  32,
);
const _bottomSheetPadding = EdgeInsets.only(top: 24, left: 18, right: 18);
const _titleFontSize = 20.0;
const _perksTitleFontSize = 15.0;
const _perksBoxPadding = EdgeInsets.symmetric(horizontal: 22, vertical: 20);
final _perksBoxBorderRadius = BorderRadius.circular(24);

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
          const _Packages(),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: NodelabsPrimaryButton(
              onTap: () {},
              title: context.t.seeAllTokens,
            ),
          )
        ],
      ),
    );
  }
}

class _Packages extends StatelessWidget {
  const _Packages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Perks extends StatelessWidget {
  const _Perks();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: _perksBoxPadding,
      decoration: BoxDecoration(
        borderRadius: _perksBoxBorderRadius,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(
                alpha: 0.1,
              ),
        ),
        gradient: RadialGradient(
          colors: [
            Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
            Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            context.t.limitedOfferBonus,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: _perksTitleFontSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 12,
            children: [
              Expanded(
                child: _PerkItem(
                  title: context.t.premiumAccount,
                  iconPath: Assets.icons.diamond,
                ),
              ),
              Expanded(
                child: _PerkItem(
                  title: context.t.moreMatch,
                  iconPath: Assets.icons.heartDouble,
                ),
              ),
              Expanded(
                child: _PerkItem(
                  title: context.t.morePromotions,
                  iconPath: Assets.icons.up,
                ),
              ),
              Expanded(
                child: _PerkItem(
                  title: context.t.moreLikes,
                  iconPath: Assets.icons.hearth2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PerkItem extends StatelessWidget {
  const _PerkItem({required this.title, required this.iconPath});

  final String title;
  final AssetGenImage iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF6F060B),
                    blurRadius: 9,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(child: Image.asset(iconPath.path)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
