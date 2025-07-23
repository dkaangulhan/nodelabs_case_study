part of 'limited_offer.dart';

const _perksTitleFontSize = 15.0;
const _perksBoxPadding = EdgeInsets.symmetric(horizontal: 22, vertical: 20);
final _perksBoxBorderRadius = BorderRadius.circular(24);

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
