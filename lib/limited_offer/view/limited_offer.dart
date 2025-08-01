import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

part '_package.dart';
part '_perk.dart';

final _blur = ImageFilter.blur(sigmaX: 6, sigmaY: 6);
const _bottomSheetBorderRadius = Radius.circular(
  32,
);
const _bottomSheetPadding = EdgeInsets.only(top: 24, left: 18, right: 18);
const _titleFontSize = 20.0;

/// Limited offer dialog.
class LimitedOffer extends StatelessWidget {
  /// Limited offer dialog.
  const LimitedOffer._();

  static Future<void> show({required BuildContext context}) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return const LimitedOffer._();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: _BottomSheet(),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: _blur,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: _bottomSheetBorderRadius,
            topRight: _bottomSheetBorderRadius,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 250, sigmaY: 250),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -60,
                      left: -20,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            backgroundBlendMode: BlendMode.plus,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -100,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            backgroundBlendMode: BlendMode.plus,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: _bottomSheetPadding,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    context.t.limitedOffer,
                    textAlign: TextAlign.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
