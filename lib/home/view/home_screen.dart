import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case_study/app_router/routes.dart';
import 'package:nodelabs_case_study/gen/assets.gen.dart';
import 'package:nodelabs_case_study/i18n/strings.g.dart';
import 'package:nodelabs_ui/nodelabs_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return _AnimatedBranchContainer(
      currentIndex: navigationShell.currentIndex,
      children: children,
    );
  }
}

class _AnimatedBranchContainer extends StatefulWidget {
  const _AnimatedBranchContainer({
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  State<_AnimatedBranchContainer> createState() =>
      _AnimatedBranchContainerState();
}

class _AnimatedBranchContainerState extends State<_AnimatedBranchContainer> {
  bool _shouldHideBottomNavbar() {
    return GoRouter.of(context).state.fullPath ==
        const UpdatePhotoRouteData().location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: widget.children.mapIndexed(
                (int index, Widget navigator) {
                  return AnimatedSlide(
                    duration: const Duration(milliseconds: 600),
                    curve: index == widget.currentIndex
                        ? Curves.easeOut
                        : Curves.easeInOut,
                    offset: Offset(
                      index == widget.currentIndex ? 0 : 0.25,
                      0,
                    ),
                    child: AnimatedOpacity(
                      opacity: index == widget.currentIndex ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: IgnorePointer(
                        ignoring: index != widget.currentIndex,
                        child: TickerMode(
                          enabled: index == widget.currentIndex,
                          child: navigator,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          // Bottom nav bar
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: 16,
            right: 16,
            bottom: _shouldHideBottomNavbar()
                ? -NodelabsCaseStudyTheme.homeScreenBottomNavbarHeight
                : NodelabsCaseStudyTheme.homeScreenPadding(context).bottom,
            child: SizedBox(
              height: NodelabsCaseStudyTheme.homeScreenBottomNavbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BottomNavbarPill(
                    title: context.t.home,
                    iconPath: Assets.icons.home,
                    onTap: () {
                      const FeedPageRouteData().go(context);
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  _BottomNavbarPill(
                    title: context.t.profile,
                    iconPath: Assets.icons.profile,
                    onTap: () {
                      const ProfilePageRouteData().go(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: NodelabsPrimaryButton(
                onTap: () {
                  const LimitedOfferPageRouteData().push<void>(context);
                },
                title: 'Limited Offer',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavbarPill extends StatelessWidget {
  const _BottomNavbarPill({
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  final String title;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            child: Row(
              children: [
                SvgIcon(iconPath: iconPath),
                const SizedBox(
                  width: 12,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
