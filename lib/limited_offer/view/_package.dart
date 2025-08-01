part of 'limited_offer.dart';

const _packageDiscountBadgeHeight = 25.0;
const _packageHeight = 200.0;
const _packageTotalHeight = 200.0 + _packageDiscountBadgeHeight / 2;
final _packageBorderRadius = BorderRadius.circular(16);
const _bestValueColor1 = Color(0xFF5949E6);

class _PackageList extends StatelessWidget {
  const _PackageList();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: 12,
      children: [
        Expanded(
          child: _Package(
            tokens: 100,
            price: '99.9₺',
            tokensInstead: 10,
          ),
        ),
        Expanded(
          child: _Package(
            tokens: 100,
            price: '99.9₺',
            tokensInstead: 10,
            isBestValue: true,
          ),
        ),
        Expanded(
          child: _Package(
            tokens: 100,
            price: '99.9₺',
            tokensInstead: 10,
          ),
        ),
      ],
    );
  }
}

class _Package extends StatelessWidget {
  const _Package({
    required this.tokens,
    required this.price,
    this.tokensInstead,
    this.isBestValue = false,
  });

  final int tokens;
  final String price;
  final int? tokensInstead;

  final bool isBestValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _packageTotalHeight,
      child: Stack(
        children: [
          // Package
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: _packageHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: _PackageGradients(
                    isBestValue: isBestValue,
                  ),
                ),
                // Package info
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (tokensInstead != null)
                              Text(
                                tokensInstead!.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  height: 1,
                                ),
                              ),
                            Text(
                              tokens.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                height: 1,
                              ),
                            ),
                            Text(
                              context.t.token,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 12,
                        endIndent: 12,
                        thickness: 1,
                        color:
                            Theme.of(context).colorScheme.onSurface.withValues(
                                  alpha: 0.1,
                                ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                height: 1,
                              ),
                            ),
                            Text(
                              context.t.tokenPerWeek,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Discount badge
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _DiscountBadge(
              discountRate: 50,
              isBestValue: isBestValue,
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageGradients extends StatelessWidget {
  const _PackageGradients({
    this.isBestValue = false,
  });
  final bool isBestValue;

  @override
  Widget build(BuildContext context) {
    final color1 = Theme.of(context).primaryColor;
    final gradientColor1 =
        isBestValue ? _bestValueColor1 : const Color(0xFF6F060B);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: _packageBorderRadius,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: _packageBorderRadius,
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4),
              ),
              gradient: RadialGradient(
                center: const Alignment(-0.8, -0.8),
                radius: 1.8,
                colors: [
                  gradientColor1,
                  color1,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiscountBadge extends StatefulWidget {
  const _DiscountBadge({
    required this.discountRate,
    this.isBestValue = false,
  });

  final int discountRate;
  final bool isBestValue;

  @override
  State<_DiscountBadge> createState() => _DiscountBadgeState();
}

class _DiscountBadgeState extends State<_DiscountBadge> {
  final _textKey = GlobalKey();

  // Variables
  double? _badgeWidth;

  // Getters
  RenderBox? get _textRenderBox {
    return _textKey.currentContext?.findRenderObject() as RenderBox?;
  }

  @override
  void initState() {
    super.initState();
    _setBadgeWidth();
  }

  @override
  void didUpdateWidget(covariant _DiscountBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setBadgeWidth();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setBadgeWidth();
  }

  void _setBadgeWidth() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_textRenderBox == null) {
        return;
      }

      _badgeWidth = _textRenderBox!.size.width + 15 * 2;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final color1 =
        widget.isBestValue ? _bestValueColor1 : const Color(0xFF6F060B);

    return Center(
      child: Offstage(
        offstage: _badgeWidth == null,
        child: SizedBox(
          height: _packageDiscountBadgeHeight,
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: _badgeWidth,
                  height: _packageDiscountBadgeHeight,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: _badgeWidth,
                  height: _packageDiscountBadgeHeight,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(1000),
                    boxShadow: [
                      BoxShadow(
                        color: color1,
                        blurRadius: 9,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  key: _textKey,
                  '%${widget.discountRate}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
